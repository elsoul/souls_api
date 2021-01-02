module Types
  class ArticleType < Types::BaseObject
    description "Artice"
    field :id, String, null: false
    field :user_id, String, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :thumnail_url, String, null: false
    field :public_date, Integer, null: false
    field :is_public, Boolean, null: true
    field :tag, [String], null: true
    # field :user, Types::UserType, null: true
    field :article_category, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
