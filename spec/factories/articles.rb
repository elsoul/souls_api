FactoryBot.define do
  factory :article do
    association :user, factory: :user
    title { Faker::Book.unique.title }
    body { Faker::Quote.matz }
    thumnail_url { Faker::Internet.url }
    public_date { DateTime.now }
    association :article_category, factory: :article_category
    is_public { false }
    just_created { false }
    slag { Faker::Internet.password(min_length: 16) }
    tags { ["tag1", "tag2", "tag3"] }
    is_deleted { false }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
