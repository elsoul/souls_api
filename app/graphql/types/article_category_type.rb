module Types
  class ArticleCategoryType < GraphQL::Schema::Object
    field :id, ID, null: true
    field :name, String, null: false
    field :total_articles, Integer, null: true
    field :tag, [String], null: true
    # field :articles, Types::ArticleType.connection_type, required: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
