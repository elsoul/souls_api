module Mutations
  module Article
    class DeleteArticle < BaseMutation
      field :article, Types::ArticleType, null: false
      argument :id, Integer, required: true

      def resolve id:
        article = Article.find id
        check_user_permissions(context[:user], article, :delete?)
        article.destroy
        { article: article }
      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid attributes for #{e.record.class}:"\
          " #{e.record.errors.full_messages.join(', ')}")
      end
    end
  end
end
