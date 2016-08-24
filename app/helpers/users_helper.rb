module UsersHelper
  def is_instance_current_users?(instance)
    user_signed_in? && instance.user.id == current_user.id
  end

  def user_nickname(user)
    user.present? ? user.nickname : 'no name'
  end
end
