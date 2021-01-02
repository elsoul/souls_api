module Mutations
  class UpdateArticle < BaseMutation
    field :article, Types::ArticleType, null: false

    argument :id, Integer, required: true
    argument :title, String, required: false
    argument :body, String, required: false
    argument :thumnail_url, String, required: false
    argument :public_date, String, required: false
    argument :article_category_id, Integer, required: false
    argument :is_public, Boolean, required: false
    argument :tag, [String], required: false
    argument :has_series, Boolean, required: false
    argument :series_id, Integer, required: false
    argument :episode_num, Integer, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

    def resolve **args
      client = blog_service_grpc_build_client
      articles = []
      articles << Rpc::Article.new(args)
      article = client.call(:UpdateArticles, articles)
      { article: Article.new(article.message.articles[0].to_h) }
    rescue StandardError => e
      puts e.error.inspect
    end
  end
end
