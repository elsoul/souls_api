module Queries
  class Article < Queries::BaseQuery
    type Types::ArticleType, null: false
    argument :id, Integer, required: true

    def resolve id:
      ::Article.find(id)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
