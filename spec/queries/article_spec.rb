RSpec.describe "Article Query テスト" do
  describe "Article データを取得する" do
    let(:user) { FactoryBot.create(:user) }
    let(:article_category) { FactoryBot.create(:article_category) }
    let(:article) { FactoryBot.create(:article, user_id: user.id, article_category_id: article_category.id) }

    let(:query) do
      data_id = Base64.encode64("Article:#{article.id}")
      %(query {
        article(id: \"#{data_id}\") {
          id
          title
          body
          thumnailUrl
          publicDate
          isPublic
          justCreated
          slag
          tags
        }
      }
    )
  end

  subject(:result) do
    SoulsApiSchema.execute(query).as_json
  end

  it "return Article Data" do
    a1 = result.dig("data", "article")
    expect(a1).to include(
      "id" => be_a(String),
        "title" => be_a(String),
        "body" => be_a(String),
        "thumnailUrl" => be_a(String),
        "publicDate" => be_a(String),
        "isPublic" => be_in([true, false]),
        "justCreated" => be_in([true, false]),
        "slag" => be_a(String),
        "tags" => be_all(String),
        )
    end
  end
end