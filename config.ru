require "./app"
require "rack/cors"
require "graphql_playground"

map "/playground" do
  use GraphQLPlayground, endpoint: "/graphql"
end

run SoulsApi
run Rack::URLMap.new("/" => SoulsApi, "/sidekiq" => Sidekiq::Web)

use Rack::Cors do
  allowed_headers = %i(get post put patch delete options head)
  allow do
    origins "*"
    resource "*", headers: :any, methods: allowed_headers
  end
end