module Mutations
  class CreateArticleCategory < BaseMutation
    field :article_category, Types::ArticleCategoryType, null: false
    field :error, String, null: false

    argument :name, String, required: true
    argument :tag, [String], required: false

    def resolve **args
      auth_check context
      check_user_permissions(context[:user], ArticleCategory.new, :create?)
      { article_category: ArticleCategory.create!(args) }
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
