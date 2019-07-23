class ManagementController < ApplicationController

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

end


