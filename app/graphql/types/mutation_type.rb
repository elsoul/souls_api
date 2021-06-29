module Types
  class MutationType < Types::BaseObject
    SoulsHelper.get_tables.each do |t|
      ["create", "update", "delete", "destroy_delete"].each do |a|
        field "#{a}_#{t.singularize.underscore}".to_sym, mutation: Object.const_get("Mutations::Base::#{t.singularize.camelize}::#{a.camelize}#{t.singularize.camelize}")
      end
    end
    # Auth
    field :sign_in_user, mutation: Mutations::UserManager::SignInUser
    field :remove_user_role, mutation: Mutations::UserManager::RemoveUserRole
    field :add_user_role, mutation: Mutations::UserManager::AddUserRole
  end
end