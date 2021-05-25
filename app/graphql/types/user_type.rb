module Types
  class UserType < BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :uid, String, null: true
    field :username, String, null: true
    field :screen_name, String, null: true
    field :last_name, String, null: true
    field :first_name, String, null: true
    field :last_name_kanji, String, null: true
    field :first_name_kanji, String, null: true
    field :last_name_kana, String, null: true
    field :first_name_kana, String, null: true
    field :email, String, null: true
    field :tel, String, null: true
    field :icon_url, String, null: true
    field :birthday, String, null: true
  end
end
