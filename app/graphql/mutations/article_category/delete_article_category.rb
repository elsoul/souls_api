module Mutations
  module ArticleCategory
    class DeleteArticleCategory < BaseMutation
      field :article_category, Types::ArticleCategoryType, null: false
      argument :id, Integer, required: true

      def resolve id:
        article_category = ::ArticleCategory.find id
        article_category.destroy
        { article_category: article_category }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
