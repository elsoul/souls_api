module Mutations

  class CreateArticle < BaseMutation
    field :article, Types::ArticleType, null: false
    field :error, String, null: false

    argument :title, String, required: true
    argument :body, String, required: true
    argument :thumnail_url, String, required: true
    argument :public_date, Integer, required: true
    argument :is_public, Boolean, required: false
    argument :tag, [String], required: false
    argument :category_id, Integer, required: false

    def resolve **args
      # login_auth token: context[:token]
      # user_id = get_token[:user_id]
      data = Article.new(args)
      data.save
      { article: data }
    rescue StandardError => error
      { error: error }
    end
  end
end
