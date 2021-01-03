module Queries
  class ArticleCategories < Queries::BaseQuery
    type [Types::ArticleCategoryType], null: false

    def resolve
      ::ArticleCategory.all
    end
  end
end