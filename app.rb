require "active_support"
require "active_support/core_ext"
require "erb"
require "json"
require "sinatra"
require "sinatra/base"
require "sinatra/json"
require "sinatra/activerecord"
require "rack/contrib"
require "zeitwerk"
require "factory_bot"
require "faker"
require "dotenv/load"
require "firebase_id_token"
require "./config/initializers/firebase_id_token"
require "./config/initializers/json_web_token"
require "graphql"
require "logger"
require "base64"
require "slack/ruby3"

ENV["RACK_ENV"] ||= "development"

db_conf = YAML.safe_load(ERB.new(File.read("./config/database.yml")).result, [], [], true)
ActiveRecord::Base.establish_connection(db_conf[ENV["RACK_ENV"]])

loader = Zeitwerk::Loader.new
loader.push_dir("#{Dir.pwd}/app/models")
loader.push_dir("#{Dir.pwd}/app/lib")

loader.do_not_eager_load("#{Dir.pwd}/app/services")
loader.collapse("#{__dir__}/app/types")
loader.collapse("#{__dir__}/app/mutations")
loader.collapse("#{__dir__}/app/queries")
loader.collapse("#{__dir__}/app/services")
loader.push_dir("#{Dir.pwd}/app/graphql")
loader.setup

class SoulsApi < Sinatra::Base
  ::Logger.class_eval { alias_method :write, :<< }
  access_log = ::File.join(::File.dirname(::File.expand_path(__FILE__)), "log", "access.log")
  access_logger = ::Logger.new(access_log)
  error_logger = ::File.new(::File.join(::File.dirname(::File.expand_path(__FILE__)), "log", "error.log"), "a+")
  error_logger.sync = true

  use Rack::JSONBodyParser
  register Sinatra::ActiveRecordExtension

  configure :production, :development do
    set :logger, Logger.new(STDOUT)
    enable :logging
    use ::Rack::CommonLogger, access_logger
  end

  before do
    env["rack.errors"] =  error_logger
  end

  error StandardError do
    StandardError.to_json
  end

  get "/" do
    message = { success: true, message: "SOULs Running!", env: ENV["RACK_ENV"] }
    json message
  end

  get "/db" do
    message = { success: true, message: "SOULs Running!", env: ENV["RACK_ENV"], db: User.first.username }
    json message
  rescue StandardError => e
    message = { error: e }
    json message
  end

  post "/graphql" do
    token = request.env["HTTP_AUTHORIZATION"]
    user_id = token ? login_auth(token: token) : nil
    context = {
      user_id: user_id
    }
    result = SoulsApiSchema.execute(
      params[:query],
      variables: params[:variables],
      context: context
    )
    json result
  rescue StandardError => error
    message = { error: error }
    json message
  end

  def login_auth token:
    decoded_token = JsonWebToken.decode token
    user_id = decoded_token[:user_id]
    user = User.find user_id
    return if user.blank?
    user_id
  rescue StandardError => error
    message = { error: error }
    json message
  end
end
