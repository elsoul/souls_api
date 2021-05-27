describe UserPolicy do
  subject { described_class.new(user, user) }

  let(:user) { FactoryBot.create(:user) }

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
