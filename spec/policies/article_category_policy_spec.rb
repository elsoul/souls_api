describe ArticleCategoryPolicy do
  subject { described_class.new(user, article_category) }

  let(:article_category) { FactoryBot.create(:article_category) }

  context "being a visitor" do
    let(:user) { FactoryBot.create(:user) }

    it { is_expected.to permit_action(:index) }
    it { is_expected.to permit_action(:show) }
    it { is_expected.to forbid_actions([:create, :update, :delete]) }
  end

  context "being a staff" do
    let(:user) { FactoryBot.create(:user, user_role: 3) }

    it { is_expected.to permit_actions([:create, :update]) }
  end

  context "being an administrator" do
    let(:user) { FactoryBot.create(:user, user_role: 4) }

    it { is_expected.to permit_actions([:create, :update, :delete]) }
  end
end
