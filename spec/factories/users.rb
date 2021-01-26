FactoryBot.define do
  factory :user do
    uid { "MyString" }
    username { "MyString" }
    screen_name { "MyString" }
    email { "MyString" }
    tel { "MyString" }
    icon_url { "MyString" }
    birthday { "MyString" }
    lang { "MyString" }
    roles_mask { 1 }
    created_at { Time.now }
    updated_at { Time.now }
  end
end
