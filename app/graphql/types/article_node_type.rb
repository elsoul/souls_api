module Types
  class ArticleNodeType < GraphQL::Schema::Object
    field :node, Types::ArticleType, null: true
  end
end
