class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  #devise
  def after_sign_in_path_for(resource)
    users_index_path
  end

  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
    
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :avatar_cache, :remove_avatar])
    end
end
