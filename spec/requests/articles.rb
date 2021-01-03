
RSpec.describe Articles, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:article_category) { FactoryBot.create(:article_category) }
  describe ".resolve" do
    it "returns an article" do
      article = FactoryBot.create(:article, user_id: user.id, article_category_id: article_category.id)
      post "/graphql", params: { query: query(id: article.id) }
      json = JSON.parse(response.body)
      data = json["data"]["article"]
      expect(data).to include(
        "id" => article.id.to_s,
        "userId" => article.user_id,
        "title" => article.title,
        "body" => article.body,
        "articleCategoryId" => article.article_category_id,
        "hasSeries" => article.has_series,
        "episodeNum" => article.episode_num,
        "thumnailUrl" => article.thumnail_url
      )
    end
  end

  # できれば tag, public_date, created_at, updated_at までテスト書きたい。
  def query(id:)
    <<~GQL
      query {
        article(id: #{id}) {
          id
          userId
          title
          body
          articleCategoryId
          hasSeries
          episodeNum
          thumnailUrl
        }
      }
    GQL
  end
end