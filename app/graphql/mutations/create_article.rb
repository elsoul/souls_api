module Mutations
  class CreateArticle < BaseMutation
    field :article, Types::ArticleType, null: false
    field :error, String, null: false

    argument :title, String, required: true
    argument :body, String, required: true
    argument :thumnail_url, String, required: true
    argument :public_date, GraphQL::Types::ISO8601DateTime, required: true
    argument :is_public, Boolean, required: false
    argument :tag, [String], required: false
    argument :category_id, Integer, required: false

    def resolve **args
      # login_auth token: context[:token]
      Article.create!(args)
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
        " #{e.record.errors.full_messages.join(', ')}")
    end
  end
end
