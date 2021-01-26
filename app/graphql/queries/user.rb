module Queries
  class User < Queries::BaseQuery
    type Types::UserType, null: false
    argument :id, Integer, required: true

    def resolve id:
      ::User.find(id)
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
