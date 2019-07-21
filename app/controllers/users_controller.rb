class UsersController < ApplicationController
  before_action :sign_in_required, only: [:show,:update,:subscribe,:unsubscribe,:index,:destroy]
  
  def show
    @user  = User.find(params[:id])
    @page_id = params[:id]
    @activities = PublicActivity::Activity.order(created_at: :desc).where(owner_id: Subscription.where(user_id: current_user.id).pluck(:followed_id), owner_type: "User")
    @myposts = Post.where(user_id: current_user.id)
  end
  
  def index
    @query = User.ransack(params[:q])
    @users = @query.result.page(params[:page]).per(16)
  end
  
  def update
    @user = User.find(params[:id])
    if can? :update, @user
      if current_user_path?(@user.id)
        @user.update_attributes(user_profile)
        render "show"
      else
        render "show"
      end
    else 
      flash[:notice] = "権限がありません"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if can? :destroy, @user
      @user.destroy
      flash[:notice] = "削除しました。"
      redirect_back(fallback_location: root_path)
    else
    flash[:notice] = "権限がありません"
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
      unless user_signed_in?
        flash[:notice] = "ログインしてください。"
        redirect_to new_user_session_url 
      end
    end
  
    def user_profile
      params.require(:user).permit(:user_profile)
    end
    
    def subs_params
      params.require(:subscription).permit(:user_id,:followed_id)
    end
end
