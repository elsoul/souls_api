FactoryBot.define do
  factory :user do
    uid { "MyString" }
    username { Faker::Internet.unique.username }
    screen_name { Faker::Internet.unique.username }
    email { Faker::Internet.unique.email }
    tel { Faker::PhoneNumber.subscriber_number(length: 10) }
    icon_url { "https://picsum.photos/200" }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    lang { "ja" }
    roles_mask { 1 }
    is_deleted { false }
    created_at { DateTime.now }
    updated_at { DateTime.now }
  end
end
