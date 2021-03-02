module Resolvers
  class ArticleSearch < Base
    include SearchObject.module(:graphql)
    scope { ::Article.all }
    type Types::ArticleType.connection_type, null: false
    description "Lists all Articles"

    class ArticleFilter < ::Types::BaseInputObject
      argument :OR, [self], required: false
      argument :title_contains, String, required: false
      argument :body_contains, String, required: false
      argument :user_id, String, required: false
      argument :is_public, Boolean, required: false
      argument :article_category_id, String, required: false
      argument :tags, [String], required: false
      argument :is_deleted, Boolean, required: false
      argument :start_date, String, required: false
      argument :end_date, String, required: false
    end

    option :filter, type: ArticleFilter, with: :apply_filter
    option :first, type: types.Int, with: :apply_first
    option :skip, type: types.Int, with: :apply_skip

    def apply_filter(scope, value)
      branches = normalize_filters(value).inject { |a, b| a.or(b) }
      scope.merge branches
    end

    def normalize_filters(value, branches = [])
      scope = ::Article.all
      scope = scope.where("title LIKE ?", "%#{value[:title_contains]}%") if value[:title_contains]
      scope = scope.where("body LIKE ?", "%#{value[:body_contains]}%") if value[:body_contains]
      scope = scope.where(user_id: decode_global_key(value[:user_id])) if value[:user_id]
      scope = scope.where(is_public: value[:is_public]) if value[:is_public]
      scope = scope.where(article_category_id: decode_global_key(value[:article_category_id])) if value[:article_category_id]
      scope = scope.where("tags @> ARRAY[?]::text[]", value[:tags]) if value[:tags]
      scope = scope.where(is_deleted: value[:is_deleted]) if value[:is_deleted]
      scope = scope.where("created_at >= ?", value[:start_date]) if value[:start_date]
      scope = scope.where("created_at <= ?", value[:end_date]) if value[:end_date]

      branches << scope

      value[:OR].inject(branches) { |s, v| normalize_filters(v, s) } if value[:OR].present?

      branches
    end
  end
end