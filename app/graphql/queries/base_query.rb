module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    def blog_host
      return "localhost:50051" if Rails.env.development? || Rails.env.test?
      ENV["GRPC_SERVER_URL1"]
    end
  end
end