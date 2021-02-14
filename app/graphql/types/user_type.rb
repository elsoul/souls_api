module Types
  class UserType < GraphQL::Schema::Object
    implements GraphQL::Types::Relay::Node

    global_id_field :id
    field :uid, String, null: true
    field :username, String, null: true
    field :screen_name, String, null: true
    field :email, String, null: true
    field :tel, String, null: true
    field :icon_url, String, null: true
    field :birthday, String, null: true
    field :lang, String, null: true
    field :roles_mask, Integer, null: true
    field :is_deleted, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: true
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
  end
end
