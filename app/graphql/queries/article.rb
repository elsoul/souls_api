module Queries
  class Article < Queries::BaseQuery
    type Types::ArticleType, null: false
    argument :id, Integer, required: true

    def resolve id:
      ::Article.find(id)
    rescue StandardError => e
      GraphQL::ExecutionError.new e
    end
  end
end
