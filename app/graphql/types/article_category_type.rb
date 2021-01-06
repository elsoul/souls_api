module Types
  class ArticleCategoryType < GraphQL::Schema::Object
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :name, String, null: false
    field :total_articles, Integer, null: true
    field :tag, [String], null: true
    field :article, Types::ArticleType.connection_type, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
