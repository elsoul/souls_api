module Mutations
  module ArticleCategory
    class CreateArticleCategory < BaseMutation
      field :article_category, Types::ArticleCategoryType, null: false
      field :error, String, null: true

      argument :name, String, required: false
      argument :tags, [String], required: false

      def resolve **args
        article_category = ::ArticleCategory.new args
        if article_category.save
          { article_category: article_category }
        else
          { error: article_category.errors.full_messages }
        end
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
