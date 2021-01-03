RSpec.describe User, type: :model do
  it "作成する" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end
