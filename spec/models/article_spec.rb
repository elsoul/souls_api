RSpec.describe Article, type: :model do
  it "作成する" do
    expect(FactoryBot.build(:article)).to be_valid
  end

  it "同じtitleがあると作成できない" do
    FactoryBot.build(:article, title: "hey")
    expect(FactoryBot.build(:article, title: "hey")).to be_valid
  end
end
