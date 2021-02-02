FactoryBot.define do
  factory :article_category do
    name { "MyString" }
    tags { ["tag1", "tag2", "tag3"] }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
