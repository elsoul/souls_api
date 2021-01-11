require "./app"
require "rack/cors"
require "graphql_playground"

map "/playground" do
  use GraphQLPlayground, endpoint: "/graphql"
end

run SoulsApi

use Rack::Cors do
  allow do
    origins "*"
    # Only allow a request for ELQUEST
    resource "/graphql",
             headers: :any,
             methods: :post,
             if: proc { |env| env["HTTP_HOST"] == "el-soul.com" }
  end
end