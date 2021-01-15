module Queries
  class Users < Queries::BaseQuery
    type [Types::UserType], null: false

    def resolve
      check_user_permissions(context[:user], User.new, :index?)
      ::User.all
    rescue StandardError => e
      GraphQL::ExecutionError.new e
    end
  end
end