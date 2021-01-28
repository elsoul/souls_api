module Mutations
  module Article
    class DeleteArticle < BaseMutation
      field :article, Types::ArticleType, null: false
      argument :id, Integer, required: true

      def resolve id:
        article = ::Article.find id
        article.destroy
        { article: article }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
