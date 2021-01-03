FactoryBot.define do
  factory :user do
    id { Faker::Internet.uuid }
    username { Faker::Name.name }
    screen_name { Faker::Name.name }
    icon_url { Faker::Internet.url }
    email { Faker::Internet.email }
    birthday { "MyString" }
    lang { "MyString" }
    total_articles { 2 }
    total_tweets { 10 }
  end
end
