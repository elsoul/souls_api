module Types
  class ArticleCategoryNodeType < GraphQL::Schema::Object
    field :node, Types::ArticleCategoryType, null: true
  end
end
