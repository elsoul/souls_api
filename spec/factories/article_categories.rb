FactoryBot.define do
  factory :article_category do
    id { Faker::Number.number(digits: 1) }
    name { Faker::Name.name }
  end
end
