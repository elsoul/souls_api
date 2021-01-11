module Types
  class ArticleType < GraphQL::Schema::Object
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :user, Types::UserType, null: false
    field :title, String, null: false
    field :body, String, null: false
    field :thumnail_url, String, null: false
    field :public_date, GraphQL::Types::ISO8601DateTime, null: false
    field :is_public, Boolean, null: false
    field :article_category, Types::ArticleCategoryType, null: false
    field :slag, String, null: false
    field :tag, [String], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
