module Types
  class ArticleSeriesType < Types::BaseObject
    field :name, String, null: false
    field :category, String, null: true
    field :total_episodes, Integer, null: true
    field :description, String, null: true
  end
end
