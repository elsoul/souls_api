module Queries
  class ArticleCategories < Queries::BaseQuery
    type [Types::ArticleCategoryType], null: false

    def resolve
      ::ArticleCategory.all
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
