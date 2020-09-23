# frozen_string_literal: true

module PostsHelper
  def already_pushedhe?(postid)
    Hebutton.find_by(post_id: postid, user_id: current_user.id).nil?
  end
end
