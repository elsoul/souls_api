module Queries
  class Articles < Queries::BaseQuery
    type [Types::ArticleType], null: false

    def resolve
      ::Article.all
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
