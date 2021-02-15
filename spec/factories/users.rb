require "gimei"
FactoryBot.define do
  factory :user do
    uid { Faker::Internet.password }
    username { Gimei.kanji }
    screen_name { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    tel { Faker::PhoneNumber.subscriber_number(length: 10) }
    icon_url { "https://picsum.photos/200" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    roles_mask { 1 }
    lang { "ja" }
    is_deleted { false }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
