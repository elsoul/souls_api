module Queries
  class Me < Queries::BaseQuery
    type Types::UserType, null: false

    def resolve
      ::User.find(context[:user].id)
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
