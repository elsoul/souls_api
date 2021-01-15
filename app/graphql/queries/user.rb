module Queries
  class User < Queries::BaseQuery
    type Types::UserType, null: false
    argument :id, ID, required: true

    def resolve id:
      user = ::User.find id
      check_user_permissions(context[:user], user, :show?)
      user
    rescue StandardError => e
      GraphQL::ExecutionError.new e
    end
  end
end