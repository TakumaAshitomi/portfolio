class ManagementController < ApplicationController
  # before_action :admin_user_only
  
  def manage
    if can? :read, "/managepage", current_user
    @userquery = User.ransack(params[:q])
    @users = @userquery.result.page(params[:page]).per(8)
    @postquery = Post.ransack(params[:q])
    @posts = @postquery.result.page(params[:page]).per(8)
    else
      redirect_to root_url 
      flash[:notice] = "管理ユーザー専用ページです。"
    end
  end

  # private
  #   def admin_user_only
  #     unless can? :read, current_user
  #       redirect_to root_url 
  #       flash[:notice] = "管理ユーザー専用ページです。"
  #     end
  #   end
end


