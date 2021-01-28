module Queries
  class User < Queries::BaseQuery
    type Types::UserType, null: false
    argument :id, String, required: true

    def resolve **args
      _, user_id = SoulsApiSchema.from_global_id args[:id]
      ::User.find(user_id)
    rescue StandardError => error
      GraphQL::ExecutionError.new error
    end
  end
end
