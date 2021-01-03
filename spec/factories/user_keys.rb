FactoryBot.define do
  factory :user_key do
    association :user, factory: :user
    association :key_group, factory: :key_group
    key { "MyText" }
  end
end
