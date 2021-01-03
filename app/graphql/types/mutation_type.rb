module Types
  class MutationType < Types::BaseObject
    field :hello_world, mutation: Mutations::HelloWorld
    field :sign_in_user, mutation: Mutations::SignInUser
    field :create_user, mutation: Mutations::CreateUser
    field :create_article, mutation: Mutations::CreateArticle
    field :create_article_category, mutation: Mutations::CreateArticleCategory
    field :update_article, mutation: Mutations::UpdateArticle
    field :delete_article, mutation: Mutations::DeleteArticle
  end
end