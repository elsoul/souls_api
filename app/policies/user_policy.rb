class UserPolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    @user.master? || @user.admin? || @user.staff? && @user.id == @record.user_id
  end

  def index?
    @user.master? || @user.admin?
  end

  def update?
    @user.master? || @user.admin? || @user.staff? && @user.id == @record.user_id
  end

  def delete?
    @user.master? || @user.admin? || @user.staff? && @user.id == @record.user_id
  end

  def update_user_role?
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