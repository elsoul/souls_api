module Types
  class MutationType < Types::BaseObject
    field :sign_in_user, mutation: Mutations::SignInUser
    field :update_user, mutation: Mutations::UpdateUser
    field :add_user_role, mutation: Mutations::AddUserRole
    field :create_article, mutation: Mutations::CreateArticle
    field :create_article_category, mutation: Mutations::CreateArticleCategory
    field :update_article, mutation: Mutations::UpdateArticle
    field :delete_article, mutation: Mutations::DeleteArticle
  end
end
