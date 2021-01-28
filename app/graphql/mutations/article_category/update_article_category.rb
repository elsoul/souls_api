module Mutations
  module ArticleCategory
    class UpdateArticleCategory < BaseMutation
      field :article_category, Types::ArticleCategoryType, null: false

      argument :name, String, required: false
      argument :tag, [String], required: false

      def resolve **args
        article_category = ::ArticleCategory.find args[:id]
        article_category.update args
        { article_category: ::ArticleCategory.find(args[:id]) }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
