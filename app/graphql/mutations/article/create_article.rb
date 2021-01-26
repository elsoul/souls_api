module Mutations
  module Article
    class CreateArticle < BaseMutation
      field :article, Types::ArticleType, null: false
      field :error, String, null: false

      argument :title, String, required: true
      argument :body, String, required: true
      argument :thumnail_url, String, required: true
      argument :public_date, GraphQL::Types::ISO8601DateTime, required: true
      argument :is_public, Boolean, required: true
      argument :slag, String, required: true
      argument :tag, [String], required: false
      argument :article_category_id, String, required: true

      def resolve **args
        auth_check context
        args[:user_id] = context[:user].id
        _, args[:article_category_id] = SoulsApiSchema.from_global_id(args[:article_category_id])
        article = Article.new args
        # check_user_permissions(context[:user], article, :create?)
        if article.save
          { article: article }
        else
          { error: article.errors.full_messages }
        end
      rescue StandardError => error
        GraphQL::ExecutionError.new("StandardError:"\
          " #{error}")
      end
    end
  end
end
