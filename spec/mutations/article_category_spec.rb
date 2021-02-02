RSpec.describe "ArticleCategory Mutation テスト" do
  describe "ArticleCategory データを登録する" do
    let(:article_category) { FactoryBot.attributes_for(:article_category) }

    let(:mutation) do
      %(mutation {
        createArticleCategory(input: {
          name: "#{article_category[:name]}"
          tags: #{article_category[:tags]}
        }) {
            articleCategory {
              id
              name
              tags
            }
          }
        }
      )
    end

    subject(:result) do
      SoulsApiSchema.execute(mutation).as_json
    end

    it "return ArticleCategory Data" do
      a1 = result.dig("data", "createArticleCategory", "articleCategory")
      expect(a1).to include(
        "id" => be_a(String),
        "name" => be_a(String),
        "tags" => be_all(String),
        )
    end
  end
end
