module Types
  class QueryType < Types::BaseObject
    field :article, resolver: Queries::Article
    field :articles, resolver: Queries::Articles
    # field :article_categories, resolver: Queries::ArticleCategories
    field :user, resolver: Queries::User
    field :users, resolver: Queries::Users
    field :article_categories, Types::ArticleCategoryType.connection_type, null: true do
      description "article_categories"
    end
    def article_categories
      ArticleCategory.all.order(id: :desc)
    end
  end
end
