class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #devise
  def after_sign_in_path_for(resource)
    users_index_path
  end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
end
