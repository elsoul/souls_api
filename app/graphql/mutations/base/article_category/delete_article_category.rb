module Mutations
  module Base::ArticleCategory
    class DeleteArticleCategory < BaseMutation
      field :article_category, Types::ArticleCategoryType, null: false
      argument :id, String, required: true

      def resolve **args
        _, data_id = SoulsApiSchema.from_global_id args[:id]
        article_category = ::ArticleCategory.find data_id
        article_category.update(is_deleted: true)
        { article_category: ::ArticleCategory.find(data_id) }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
