module Mutations
  module Article
    class UpdateArticle < BaseMutation
      field :article, Types::ArticleType, null: false

      argument :id, Integer, required: true
      argument :title, String, required: false
      argument :body, String, required: false
      argument :thumnail_url, String, required: false
      argument :public_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :article_category_id, Integer, required: false
      argument :is_public, Boolean, required: false
      argument :tag, [String], required: false
      argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
      argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false

      def resolve **args
        article = Article.find args[:id]
        check_user_permissions(context[:user], article, :update?)
        article.update args
        { article: Article.find(args[:id]) }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
