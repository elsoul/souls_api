module Mutations
  class SignInUser < BaseMutation
    field :status, String, null: false
    field :username, String, null: true
    argument :token, String, required: false

    def resolve token:
      fb_auth token: context[:token]
      begin
        user = User.find @payload["sub"]
        user.update(icon_url: @payload["picture"], username: @payload["name"])
        { status: "ログイン成功!", username: user.username }
      rescue
        user = User.create(id: @payload["sub"], email: @payload["email"])
        user.update(icon_url: @payload["picture"], username: @payload["name"])
        { status: "ユーザー新規登録完了!", username: user.username }
      end
    rescue StandardError => error
      { status: error }
    end
  end
end
