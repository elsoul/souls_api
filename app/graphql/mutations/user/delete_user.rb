module Mutations
  module User
    class DeleteUser < BaseMutation
      field :user, Types::UserType, null: false
      argument :id, Integer, required: true

      def resolve id:
        user = ::User.find id
        user.destroy
        { user: user }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
