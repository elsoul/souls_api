module Types
  class ArticleType < GraphQL::Schema::Object
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :user_id, Integer, null: true
    field :title, String, null: true
    field :body, String, null: true
    field :thumnail_url, String, null: true
    field :public_date, GraphQL::Types::ISO8601DateTime, null: true
    field :article_category_id, Integer, null: true
    field :is_public, Boolean, null: true
    field :just_created, Boolean, null: true
    field :slag, String, null: true
    field :tag, [String], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
