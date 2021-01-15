module UserHelper
  def check_user_permissions(user, obj, method)
    policy_class = obj.class.name + "Policy"
    policy_clazz = policy_class.constantize.new(user, obj)
    permission = policy_clazz.send(method)
    raise Pundit::NotAuthorizedError, "permission error!" unless permission
  end
end