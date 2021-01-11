module Mutations
  class SignInUser < BaseMutation
    field :status, String, null: false
    field :username, String, null: true
    field :token, String, null: true
    argument :token, String, required: false

    def resolve token:
      fb_auth token: token
      begin
        user = User.find_by_uid @payload["sub"]
        user.update(icon_url: @payload["picture"], username: @payload["name"])
        token_base = JsonWebToken.encode(user_id: user.id)
        { status: "ログイン成功!", username: user.username, token: token_base }
      rescue
        user = User.new(uid: @payload["sub"], email: @payload["email"], icon_url: @payload["picture"], username: @payload["name"])
        if user.save
          token = JsonWebToken.encode(user_id: user.id)
          { status: "ユーザー新規登録完了!", username: user.username, token: token }
        else
          { status: user.errors.full_messages }
        end
      end
    end
  end
end
