module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::User::SignInUser
    field :add_user_role, mutation: Mutations::User::AddUserRole
    field :remove_user_role, mutation: Mutations::User::RemoveUserRole

    field :create_article_category, mutation: Mutations::ArticleCategory::CreateArticleCategory
    field :update_article_category, mutation: Mutations::ArticleCategory::UpdateArticleCategory
    field :delete_article_category, mutation: Mutations::ArticleCategory::DeleteArticleCategory
    field :destroy_delete_article_category, mutation: Mutations::ArticleCategory::DestroyDeleteArticleCategory
    field :create_article, mutation: Mutations::Article::CreateArticle
    field :update_article, mutation: Mutations::Article::UpdateArticle
    field :delete_article, mutation: Mutations::Article::DeleteArticle
    field :destroy_delete_article, mutation: Mutations::Article::DestroyDeleteArticle
    field :create_user, mutation: Mutations::User::CreateUser
    field :update_user, mutation: Mutations::User::UpdateUser
    field :delete_user, mutation: Mutations::User::DeleteUser
    field :destroy_delete_user, mutation: Mutations::User::DestroyDeleteUser
  end
end
