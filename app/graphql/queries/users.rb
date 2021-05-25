module Queries
  class Users < Queries::BaseQuery
    type [Types::UserType], null: false

    def resolve
      ::User.all
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
