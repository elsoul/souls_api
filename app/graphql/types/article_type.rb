module Types
  class ArticleType < BaseObject
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :article_category, Types::ArticleCategoryType, null: false
    field :body, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :is_deleted, Boolean, null: true
    field :is_public, Boolean, null: true
    field :just_created, Boolean, null: true
    field :public_date, GraphQL::Types::ISO8601DateTime, null: true
    field :slag, String, null: true
    field :tags, [String], null: true
    field :thumnail_url, String, null: true
    field :title, String, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
    field :user, Types::UserType, null: false
  end
end
