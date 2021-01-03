module Types
  class QueryType < Types::BaseObject
    field :article, resolver: Queries::Article
    field :articles, resolver: Queries::Articles
    field :article_categories, resolver: Queries::ArticleCategories
    field :user, resolver: Queries::User
    field :users, resolver: Queries::Users
  end
end
