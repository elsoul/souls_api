RSpec.describe "UserSearch Resolver テスト" do
  describe "削除フラグ false の User を返却する" do
    let!(:user) { FactoryBot.create(:user) }

    let(:query) do
      %(query {
        userSearch(filter: {
          isDeleted: false
      }) {
          edges {
            cursor
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
            nodes {
              id
            }
            pageInfo {
              endCursor
              hasNextPage
              startCursor
              hasPreviousPage
            }
          }
        }
      )
    end

    subject(:result) do
      SoulsApiSchema.execute(query).as_json
    end

    it "return User Data" do
      begin
        a1 = result.dig("data", "userSearch", "edges")[0]["node"]
        raise unless a1.present?
      rescue
        raise StandardError, result
      end
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