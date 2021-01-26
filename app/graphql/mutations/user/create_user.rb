module Mutations
  module User
    class CreateUser < BaseMutation
      field :user, Types::UserType, null: false
      field :error, String, null: true

      argument :uid, String, required: false
      argument :username, String, required: false
      argument :screen_name, String, required: false
      argument :email, String, required: false
      argument :tel, String, required: false
      argument :icon_url, String, required: false
      argument :birthday, String, required: false
      argument :lang, String, required: false
      argument :roles_mask, Integer, required: false
      argument :total_articles, Integer, required: false
      argument :total_tweets, Integer, required: false

      def resolve **args
        user = ::User.new args
        if user.save
          { user: user }
        else
          { error: user.errors.full_messages }
        end
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
