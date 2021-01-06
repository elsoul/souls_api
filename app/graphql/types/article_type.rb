module Types
  class ArticleType < GraphQL::Schema::Object
    description "Article"
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :title, String, null: true
    field :body, String, null: true
    field :thumnail_url, String, null: true
    field :public_date, GraphQL::Types::ISO8601DateTime, null: true
    field :is_public, Boolean, null: true
    field :tag, [String], null: true
    field :user, Types::UserType, null: true
    field :article_category, Types::ArticleCategoryType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
