module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::User::SignInUser
    field :create_user, mutation: Mutations::User::CreateUser
    field :add_user_role, mutation: Mutations::User::AddUserRole
    field :remove_user_role, mutation: Mutations::User::RemoveUserRole
    
    field :create_article_category, mutation: Mutations::ArticleCategory::CreateArticleCategory
    field :update_article_category, mutation: Mutations::ArticleCategory::UpdateArticleCategory
    field :delete_article_category, mutation: Mutations::ArticleCategory::DeleteArticleCategory
    field :create_article, mutation: Mutations::Article::CreateArticle
    field :update_article, mutation: Mutations::Article::UpdateArticle
    field :delete_article, mutation: Mutations::Article::DeleteArticle
    field :create_user, mutation: Mutations::User::CreateUser
    field :update_user, mutation: Mutations::User::UpdateUser
    field :delete_user, mutation: Mutations::User::DeleteUser
  end
end
