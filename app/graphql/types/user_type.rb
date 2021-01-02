module Types
  class UserType < Types::BaseObject
    field :id, String, null: false
    field :username, String, null: false
    field :screen_name, String, null: false
    field :email, String, null: false
    field :icon_url, String, null: true
    field :birthday, String, null: true
    field :lang, String, null: true
    field :total_articles, Integer, null: true
    field :total_tweets, Integer, null: true
    field :tw_consumer_key, String, null: true
    field :tw_consumer_secret, String, null: true
    field :tw_access_token, String, null: true
    field :tw_access_token_secret, String, null: true
    #field :gem, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
