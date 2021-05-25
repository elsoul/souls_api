module Types
  class ArticleNodeType < BaseObject
    field :node, Types::ArticleType, null: true
  end
end
