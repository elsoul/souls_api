module Queries
  class Articles < Queries::BaseQuery
    type [Types::ArticleType], null: false
    argument :limit, Integer, required: false

    def resolve **args
      client = blog_service_grpc_build_client
      client_args = {
        limit: args[:limit].to_i || 10
      }
      client_args[:search] = args[:search] if args[:search].to_s.present?
      article = client.call(:GetArticles, client_args)
      article.message
    rescue StandardError => e
      puts e.error.inspect
    end
  end
end
