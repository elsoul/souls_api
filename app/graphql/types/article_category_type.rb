module Types
  class ArticleCategoryType < Types::BaseObject
    field :id, Integer, null: true
    field :name, String, null: false
    field :total_articles, Integer, null: true
    field :tag, [String], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
