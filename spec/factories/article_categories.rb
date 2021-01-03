FactoryBot.define do
  factory :article_category do
    id { Faker::Number.number(digits: 1) }
    name { Faker::Name.name }
    tag { ["tag1", "tag2", "tag3"] }
  end
end
