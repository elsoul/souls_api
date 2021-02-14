module Mutations
  module User
    class UpdateUser < BaseMutation
      field :user_edge, Types::UserNodeType, null: false

      argument :id, String, required: true
      argument :uid, String, required: false
      argument :username, String, required: false
      argument :screen_name, String, required: false
      argument :email, String, required: false
      argument :tel, String, required: false
      argument :icon_url, String, required: false
      argument :birthday, String, required: false
      argument :lang, String, required: false
      argument :roles_mask, Integer, required: false
      argument :is_deleted, Boolean, required: false

      def resolve **args
        _, args[:id] = SoulsApiSchema.from_global_id(args[:id])
        user = ::User.find args[:id]
        user.update args
        { user_edge: { node: ::User.find(args[:id]) } }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
