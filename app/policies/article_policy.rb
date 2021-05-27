class ArticlePolicy < ApplicationPolicy
  def show?
    true
  end

  def index?
    true
  end

  def create?
    staff_permissions?
  end

  def update?
    staff_permissions?
  end

  def delete?
    admin_permissions?
  end

  private

  def staff_permissions?
    @user.master? or @user.admin? or @user.staff?
  end

  def admin_permissions?
    @user.master? or @user.admin?
  end
end
