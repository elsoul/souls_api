module Mutations
  module Article
    class UpdateArticle < BaseMutation
      field :article, Types::ArticleType, null: false

      argument :user_id, Integer, required: false
      argument :title, String, required: false
      argument :body, String, required: false
      argument :thumnail_url, String, required: false
      argument :public_date, GraphQL::Types::ISO8601DateTime, required: false
      argument :article_category_id, Integer, required: false
      argument :is_public, Boolean, required: false
      argument :just_created, Boolean, required: false
      argument :slag, String, required: false
      argument :tag, [String], required: false

      def resolve **args
        article = ::Article.find args[:id]
        article.update args
        { article: ::Article.find(args[:id]) }
      rescue StandardError => error
        GraphQL::ExecutionError.new error
      end
    end
  end
end
