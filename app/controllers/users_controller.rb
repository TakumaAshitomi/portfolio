class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  
  def show
  end
  
  def index
    @user = User.all
  end
  
  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
  
end
