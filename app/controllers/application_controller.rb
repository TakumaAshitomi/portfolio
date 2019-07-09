class ApplicationController < ActionController::Base
  include UsersHelper
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?

  def after_sign_in_path_for(resource)
    users_path
  end
    
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    end
    
    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :avatar, :avatar_cache, :remove_avatar])
    end
    
end
