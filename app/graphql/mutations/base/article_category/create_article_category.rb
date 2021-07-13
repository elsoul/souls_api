module Mutations
  module Base::ArticleCategory
    class CreateArticleCategory < BaseMutation
      field :article_category_edge, Types::ArticleCategoryType.edge_type, null: false
      field :error, String, null: true

      argument :is_deleted, Boolean, required: false
      argument :name, String, required: false
      argument :tags, [String], required: false

      def resolve(**args)
        article_category = ::ArticleCategory.new(args)
        if article_category.save
          { article_category_edge: { node: article_category } }
        else
          { error: article_category.errors.full_messages }
        end
      rescue StandardError => e
        GraphQL::ExecutionError.new(e)
      end
    end
  end
end
