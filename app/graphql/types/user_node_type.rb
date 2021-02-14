module Types
  class UserNodeType < GraphQL::Schema::Object
    field :node, Types::UserType, null: true
  end
end
