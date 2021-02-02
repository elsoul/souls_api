FactoryBot.define do
  factory :article do
    association :user, factory: :user
    title { "MyString" }
    body { "MyString" }
    thumnail_url { "MyString" }
    public_date { DateTime.now }
    association :article_category, factory: :article_category
    is_public { false }
    just_created { false }
    slag { "MyString" }
    tags { ["tag1", "tag2", "tag3"] }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
