RSpec.describe "User Mutation テスト" do
  describe "User を作成する" do
    let!(:user) { FactoryBot.create(:user) }

    let(:mutation) do
      %(mutation {
        createUser(input: {
          uid: "#{user.uid}"
          username: "#{user.username}"
          screenName: "#{user.screen_name}"
          email: "#{user.email}"
          tel: "#{user.tel}"
          iconUrl: "#{user.icon_url}"
          birthday: "#{user.birthday}"
          lang: "#{user.lang}"
          rolesMask: #{user.roles_mask}
        }) {
            user {
              id
              uid
              username
              screenName
              email
              tel
              iconUrl
              birthday
              lang
              rolesMask
            }
          }
        }
      )
    end

    subject(:result) do
      SoulsApiSchema.execute(mutation).as_json
    end

    it "return User Data" do
      a1 = result.dig("data", "createUser", "user")
      expect(a1).to include(
        "id" => be_a(String),
        "uid" => be_a(String),
        "username" => be_a(String),
        "screenName" => be_a(String),
        "email" => be_a(String),
        "tel" => be_a(String),
        "iconUrl" => be_a(String),
        "birthday" => be_a(String),
        "lang" => be_a(String),
        "rolesMask" => be_a(Integer),
        )
    end
  end
end
