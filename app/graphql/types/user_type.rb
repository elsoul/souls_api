module Types
  class UserType < Types::BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :uid, String, null: false
    field :username, String, null: false
    field :screen_name, String, null: false
    field :email, String, null: false
    field :tel, String, null: false
    field :icon_url, String, null: true
    field :birthday, String, null: true
    field :lang, String, null: true
    field :roles_mask, Integer, null: true
    field :total_articles, Integer, null: true
    field :total_tweets, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
