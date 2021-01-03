RSpec.describe ArticleCategory, type: :model do
  it "作成する" do
    expect(FactoryBot.build(:article_category)).to be_valid
  end
end
