FactoryBot.define do
  factory :article do
    association :user, factory: :user
    title { Faker::Lorem.paragraph }
    body { Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 5) }
    thumnail_url { Faker::Internet.url }
    public_date { Time.now }
    association :article_category, factory: :article_category
    is_public { true }
    tag { ["tag1", "tag2", "tag3"] }
    has_series { false }
    series_id { 1 }
    episode_num { Faker::Number.number(digits: 1) }
  end
end
