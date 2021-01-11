RSpec.describe Types::ArticleType do
  describe "Article" do
    let(:user) { FactoryBot.create(:user) }
    let(:article_category) { FactoryBot.create(:article_category) }
    let!(:article) { FactoryBot.create(:article) }

    let(:query) do
      %(query {
        article(id: 1) {
          id
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
            totalArticles
            totalTweets
          }
          title
          body
          thumnailUrl
          publicDate
          articleCategory {
            id
            name
          }
          slag
          tag
        }
      })
    end

    subject(:result) do
      SoulsApiSchema.execute(query).as_json
    end

    it "return Article User Data" do
      article_user = JSON.parse(article.user.to_json)
      user = {}
      article_user.each do |key, value|
        user[key.camelize(:lower)] = value
        user.delete("createdAt") if key == "created_at"
        user.delete("updatedAt") if key == "updated_at"
      end
      id = SoulsApiSchema.to_global_id "User", user["id"]
      user["id"] = id
      a1 = result.dig("data", "article", "user")
      expect(a1).to eq user
    end
  end
end