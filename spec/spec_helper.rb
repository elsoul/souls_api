ENV["RACK_ENV"] = "test"
require "./app"
require "rspec"
# require "test/unit"
require "rack/test"
require "database_cleaner"
require "capybara/rspec"
require "capybara/user_agent"
require "webmock/rspec"

abort("The Souls environment is running in production mode!") if ENV["RACK_ENV"] == "production"

WebMock.disable_net_connect!(allow_localhost: true)

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

def app
  SoulsApi
end

Dir[File.expand_path "#{Rack::Directory.new("").root}/spec/queries/*.rb"].sort.each { |file| require file }
Dir[File.expand_path "#{Rack::Directory.new("").root}/spec/mutations/*.rb"].sort.each { |file| require file }

RSpec.configure do |config|
  config.order = :random

  config.include Capybara::DSL
  config.include Capybara::UserAgent::DSL
  config.expect_with :rspec do |expectations|
    # config.filter_run_excluding skip: true
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.include FactoryBot::Syntax::Methods
  config.include Rack::Test::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |_example|
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.append_after(:each) do |_example|
    DatabaseCleaner.clean
  end
  config.filter_run_excluding long: true
  config.filter_run_excluding uses_external_service: true
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end

ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection

class ActiveSupport::TestCase
  setup :begin_gc_deferment
  teardown :reconsider_gc_deferment
  teardown :scrub_instance_variables

  @@reserved_ivars = %w(@_implementation @_result @_proxy @_assigns_hash_proxy @_backtrace)
  DEFERRED_GC_THRESHOLD = (ENV["DEFER_GC"] || 1.0).to_f

  @@last_gc_run = Time.now

  def begin_gc_deferment
    GC.disable if DEFERRED_GC_THRESHOLD > 0
  end

  def reconsider_gc_deferment
    if DEFERRED_GC_THRESHOLD > 0 && Time.now - @@last_gc_run >= DEFERRED_GC_THRESHOLD
      GC.enable
      GC.start
      GC.disable

      @@last_gc_run = Time.now
    end
  end

  def scrub_instance_variables
    (instance_variables - @@reserved_ivars).each do |ivar|
      instance_variable_set(ivar, nil)
    end
  end
end
