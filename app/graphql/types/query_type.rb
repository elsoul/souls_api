module Types
  class QueryType < Types::BaseObject
    field :article, resolver: Queries::Article
    field :articles, Types::ArticleType.connection_type, null: true
    field :user, resolver: Queries::User
    field :users, Types::UserType.connection_type, null: true
    field :article_categories, Types::ArticleCategoryType.connection_type, null: true do
      description "article_categories"
    end

    def users
      User.all.order(id: :desc)
    end

    def article_categories
      ArticleCategory.all.order(id: :desc)
    end

    def articles
      Article.all.order(id: :desc)
    end
  end
end
