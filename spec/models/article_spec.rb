RSpec.describe Article, type: :model do
  it "作成する" do
    expect(FactoryBot.build(:article)).to be_valid
  end
end
