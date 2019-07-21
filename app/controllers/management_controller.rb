class ManagementController < ApplicationController
  before_action :admin_user_only
  
  def manage
    @userquery = User.ransack(params[:q])
    @users = @userquery.result.page(params[:page]).per(8)
    @postquery = Post.ransack(params[:q])
    @posts = @postquery.result.page(params[:page]).per(8)
  end

  private
    def admin_user_only
      unless current_user.admin?
        redirect_to root_url 
        flash[:notice] = "管理ユーザー専用ページです。"
      end
    end
end


