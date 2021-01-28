module Queries
  class ArticleCategory < Queries::BaseQuery
    type Types::ArticleCategoryType, null: false
    argument :id, String, required: true

    def resolve **args
      _, article_category_id = SoulsApiSchema.from_global_id args[:id]
      ::ArticleCategory.find(article_category_id)
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
