FactoryBot.define do
  factory :article_category do
    name { Faker::Name.name }
    tag { ["tag1", "tag2", "tag3"] }
  end
end
