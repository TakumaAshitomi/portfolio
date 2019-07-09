class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show]
  def show
    @user  = User.find(params[:id])
    @page_id = params[:id]
    @activities = PublicActivity::Activity.order(created_at: :desc).where(owner_id: Subscription.where(user_id: current_user.id).pluck(:followed_id), owner_type: "User")
    @myposts = Post.where(user_id: current_user.id)
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
  
  def subscribe
    @subscribe = Subscription.new
    @subscribe.user_id = current_user.id
    @subscribe.followed_id = params[:id]
    @subscribe.save
    respond_to do |format|
      format.html { redirect_to "/users/#{params[:id]}" }
      format.js
    end
  end
  
  def unsubscribe
    @subscribe = Subscription.find_by(user_id: current_user.id, followed_id: params[:id])
    @subscribe.destroy
    respond_to do |format|
      format.html { redirect_to "/users/#{params[:id]}" }
      format.js
    end
  end
  
  private
    def sign_in_required
      redirect_to new_user_session_url unless user_signed_in?
    end
  
    def only_edit_user_profile
      params.require(:user).permit(:user_profile)
    end
    
    def subs_params
      params.require(:subscription).permit(:user_id,:followed_id)
    end
end
