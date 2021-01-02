module Queries
  class Users < Queries::BaseQuery
    type [Types::UserType], null: false

    def resolve
      puts context.to_json
      ::User.all
    end
  end
end