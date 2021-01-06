module Queries
  class Articles < Queries::BaseQuery
    type [Types::ArticleType], null: false

    def resolve
      ::Article.all
    end
  end
end
