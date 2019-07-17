class ManagementController < ApplicationController
  before_action :admin_user_only
  
  def manage
    @userquery = User.ransack(params[:q])
    @users = @userquery.result.page(params[:page]).per(16)
    @postquery = Post.ransack(params[:q])
    @posts = @postquery.result.page(params[:page]).per(16)
  end

  private
    def admin_user_only
      redirect_to root_url unless current_user.admin?
      flash[:notice] = "管理ユーザー専用ページです。"
    end
end


