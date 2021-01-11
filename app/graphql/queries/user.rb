module Queries
  class User < Queries::BaseQuery
    type Types::UserType, null: false
    argument :id, ID, required: true

    def resolve id:
      ::User.find id
    rescue StandardError => e
      GraphQL::ExecutionError.new e
    end
  end
end