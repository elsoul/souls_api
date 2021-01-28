RSpec.describe "User Model テスト", type: :model do
  describe "User データを登録する" do
    it "valid User Model" do
      expect(FactoryBot.build(:user)).to be_valid
    end
  end
end
