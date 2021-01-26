module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::User::SignInUser
    field :create_user, mutation: Mutations::User::CreateUser
    field :delete_user, mutation: Mutations::User::DeleteUser
    field :update_user, mutation: Mutations::User::UpdateUser
    field :add_user_role, mutation: Mutations::User::AddUserRole
    field :remove_user_role, mutation: Mutations::User::RemoveUserRole
    field :create_article, mutation: Mutations::Article::CreateArticle
    field :create_article_category, mutation: Mutations::ArticleCategory::CreateArticleCategory
    field :update_article, mutation: Mutations::Article::UpdateArticle
    field :delete_article, mutation: Mutations::Article::DeleteArticle
  end
end
