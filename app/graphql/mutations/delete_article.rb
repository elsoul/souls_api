module Mutations
  class DeleteArticle < BaseMutation
    field :article, Types::ArticleType, null: false
    argument :id, Integer, required: true

    def resolve id:
      client = blog_service_grpc_build_client
      article = client.call(:DeleteArticle, id: id)
      { article: Article.new(article.message.article.to_h) }
    rescue StandardError => e
      puts e.error.inspect
    end
  end
end
