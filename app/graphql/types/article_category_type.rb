module Types
  class ArticleCategoryType < Types::BaseObject
    field :name, String, null: false
    field :total_articles, Integer, null: true
    field :tag, [String], null: true
  end
end
