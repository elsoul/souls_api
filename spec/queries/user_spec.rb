RSpec.describe "User Query テスト" do
  describe "User データを取得する" do
    let(:user) { FactoryBot.create(:user) }

    let(:query) do
      data_id = Base64.encode64("User:#{user.id}")
      %(query {
        user(id: \"#{data_id}\") {
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
    )
  end

  subject(:result) do
    SoulsApiSchema.execute(query).as_json
  end

  it "return User Data" do
    a1 = result.dig("data", "user")
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
