module UsersHelper

  def current_user_path?(user_id)
    user_id.to_i == current_user.id
  end
end
