module Types
  class UserNodeType < BaseObject
    field :node, Types::UserType, null: true
  end
end
