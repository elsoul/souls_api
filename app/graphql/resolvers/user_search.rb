module Resolvers
  class UserSearch < Base
    include SearchObject.module(:graphql)
    scope { ::User.all }
    type Types::UserType.connection_type, null: false
    description "Search Users"

    class UserFilter < ::Types::BaseInputObject
      argument :OR, [self], required: false
      argument :uid, String, required: false
      argument :username, String, required: false
      argument :screen_name, String, required: false
      argument :email, String, required: false
      argument :tel, String, required: false
      argument :icon_url, String, required: false
      argument :birthday, String, required: false
      argument :lang, String, required: false
      argument :roles_mask, Integer, required: false
      argument :start_date, String, required: false
      argument :end_date, String, required: false
    end

    # when "filter" is passed "apply_filter" would be called to narrow the scope
    option :filter, type: UserFilter, with: :apply_filter
    option :first, type: types.Int, with: :apply_first
    option :skip, type: types.Int, with: :apply_skip

    # apply_filter recursively loops through "OR" branches
    def apply_filter(scope, value)
      branches = normalize_filters(value).inject { |a, b| a.or(b) }
      scope.merge branches
    end

    def apply_first(scope, value)
      scope.limit(value)
    end

    def apply_skip(scope, value)
      scope.offset(value)
    end

    def decode_global_key id
      _, data_id = SoulsApiSchema.from_global_id id
      data_id
    end

    def normalize_filters(value, branches = [])
      scope = ::User.all
      scope = scope.where(uid: value[:uid]) if value[:uid]
      scope = scope.where(username: value[:username]) if value[:username]
      scope = scope.where(screen_name: value[:screen_name]) if value[:screen_name]
      scope = scope.where(email: value[:email]) if value[:email]
      scope = scope.where(tel: value[:tel]) if value[:tel]
      scope = scope.where(icon_url: value[:icon_url]) if value[:icon_url]
      scope = scope.where(birthday: value[:birthday]) if value[:birthday]
      scope = scope.where(lang: value[:lang]) if value[:lang]
      scope = scope.where(roles_mask: value[:roles_mask]) if value[:roles_mask]
      scope = scope.where("created_at >= ?", value[:start_date]) if value[:start_date]
      scope = scope.where("created_at <= ?", value[:end_date]) if value[:end_date]

      branches << scope

      value[:OR].inject(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

      branches
    end
  end
end