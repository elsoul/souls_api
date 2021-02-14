RSpec.describe "User Mutation テスト" do
  describe "User データを登録する" do
    let(:user) { FactoryBot.attributes_for(:user) }

    let(:mutation) do
      %(mutation {
        createUser(input: {
          uid: "#{user[:uid]}"
          username: "#{user[:username]}"
          screenName: "#{user[:screen_name]}"
          email: "#{user[:email]}"
          tel: "#{user[:tel]}"
          iconUrl: "#{user[:icon_url]}"
          birthday: "#{user[:birthday]}"
          lang: "#{user[:lang]}"
          rolesMask: #{user[:roles_mask]}
          isDeleted: #{user[:is_deleted]}
        }) {
            userEdge {
          node {
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
              isDeleted
              }
            }
          }
        }
      )
    end

    subject(:result) do
      SoulsApiSchema.execute(mutation).as_json
    end

    it "return User Data" do
      a1 = result.dig("data", "createUser", "userEdge", "node")
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
        "isDeleted" => be_in([true, false]),
        )
    end
  end
end
