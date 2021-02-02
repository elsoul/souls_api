module Mutations
  module ArticleCategory
    class UpdateArticleCategory < BaseMutation
      field :article_category, Types::ArticleCategoryType, null: false

      argument :id, String, required: true
      argument :name, String, required: false
      argument :tags, [String], required: false

      def resolve **args
        _, args[:id] = SoulsApiSchema.from_global_id(args[:id])
        article_category = ::ArticleCategory.find args[:id]
        article_category.update args
        { article_category: ::ArticleCategory.find(args[:id]) }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
