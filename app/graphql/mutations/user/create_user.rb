module Mutations
  module User
    class CreateUser < BaseMutation
      field :user_edge, Types::UserNodeType, null: false
      field :error, String, null: true

      argument :birthday, String, required: false
      argument :email, String, required: false
      argument :first_name, String, required: false
      argument :first_name_kana, String, required: false
      argument :first_name_kanji, String, required: false
      argument :icon_url, String, required: false
      argument :last_name, String, required: false
      argument :last_name_kana, String, required: false
      argument :last_name_kanji, String, required: false
      argument :screen_name, String, required: false
      argument :tel, String, required: false
      argument :uid, String, required: false
      argument :username, String, required: false

      def resolve **args
        user = ::User.new args
        if user.save
          { user_edge: { node: user } }
        else
          { error: user.errors.full_messages }
        end
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
