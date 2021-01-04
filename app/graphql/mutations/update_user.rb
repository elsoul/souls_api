module Mutations
  include JsonAuth
  class UpdateUser < BaseMutation
    argument :uid, String, required: true
    argument :username, String, required: true
    argument :email, String, required: true
    argument :tel, String, required: true
    argument :screen_name, String, required: true
    argument :icon_url, String, required: false
    argument :birthday, String, required: false
    argument :lang, String, required: false
    argument :total_articles, String, required: false
    argument :total_tweets, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

    field :status, String, null: true
    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve **args
      fb_auth token: args[:token]
      token = JsonWebToken.encode({ user_id: @payload["sub"] }, 0)
      begin
        user = User.find token
        user.update(icon_url: @payload["picture"], username: @payload["name"])
        session_token = JsonWebToken.encode(user_id: @payload["sub"])
        { status: "ログイン成功!", token: session_token, user: user }
      rescue
        user = User.create(id: token, email: @payload["email"])
        user.update(icon_url: @payload["picture"], username: @payload["name"])
        session_token = JsonWebToken.encode(user_id: @payload["sub"])
        { status: "ユーザー新規登録完了!", token: session_token, user: user }
      end
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
