require "erb"
require "sinatra"
require "sinatra/base"
require "sinatra/json"
require "sinatra/activerecord"
require "rack/contrib"
require "zeitwerk"
require "dotenv/load"
require "firebase_id_token"
require "./config/initializers/firebase_id_token"
require "./config/initializers/json_auth"
require "graphql"
require "logger"

include JsonAuth

loader = Zeitwerk::Loader.new
loader.push_dir("#{Dir.pwd}/app/models")

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

  set :database_file, "config/database.yml"
  use Rack::JSONBodyParser

  configure :production, :development do
    set :logger, Logger.new(STDOUT)
    enable :logging
    use ::Rack::CommonLogger, access_logger
  end

  before do
    env["rack.errors"] =  error_logger
  end

  get "/" do
    message = { success: true, message: "SOULs Running!" }
    json message
  end

  post "/graphql" do
    token = request.env["HTTP_AUTHORIZATION"]
    context = {
      token: token
    }
    result = SoulsApiSchema.execute(
      params[:query],
      variables: params[:variables],
      context: context
    )
    json result
  end
end
