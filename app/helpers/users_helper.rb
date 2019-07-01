module UsersHelper

  def current_user_path?(user_id)
    user_id.to_i == current_user.id
  end
  
  def already_subscribed?(id)
    Subscription.find_by(user_id:current_user.id, followed_id:id).nil?
  end
end
