module Mutations
  module Article
    class CreateArticle < BaseMutation
      field :article, Types::ArticleType, null: false
      field :error, String, null: true

      argument :title, String, required: false
      argument :body, String, required: false
      argument :thumnail_url, String, required: false
      argument :public_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :article_category_id, String, required: false
      argument :is_public, Boolean, required: false
      argument :just_created, Boolean, required: false
      argument :slag, String, required: false
      argument :tags, [String], required: false

      def resolve **args
        args[:user_id] = context[:user].id
        _, args[:article_category_id] = SoulsApiSchema.from_global_id(args[:article_category_id])
        article = ::Article.new args
        if article.save
          { article: article }
        else
          { error: article.errors.full_messages }
        end
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
