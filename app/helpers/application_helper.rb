module ApplicationHelper
  def user_image(user)
    if user.persisted? && user.avatar?
      user.avatar.to_s
    else
      "no_avatar.png"
    end
  end
end
