class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def show
    @user  = User.find(params[:id])
    @page_id = params[:id]
  end
  
  def index
    @users = User.page(params[:page]).per(4)
  end
  
  def update
    @user = User.find(params[:id])
    if current_user_path?(@user.id)
      @user.update_attributes(only_edit_user_profile)
      render "show"
    else
      render "show"
    end
  end
  
  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
  
    def only_edit_user_profile
      params.require(:user).permit(:user_profile)
    end
end
