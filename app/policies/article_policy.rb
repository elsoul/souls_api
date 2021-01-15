class ArticlePolicy < ApplicationPolicy
  def create?
    staff_permissions?
  end

  def show?
    true
  end

  def index?
    true
  end

  def update?
    @user.master? || @user.admin? || @user.staff? && @user.id == @record.user_id
  end

  def delete?
    @user.master? || @user.admin? || @user.staff? && @user.id == @record.user_id
  end

  private

  def staff_permissions?
    @user.master? or @user.admin? or @user.staff?
  end

  def admin_permissions?
    @user.master? or @user.admin?
  end
end