class ManagementController < ApplicationController
  def manage
    @userquery = User.ransack(params[:q])
    @users = @userquery.result.page(params[:page]).per(16)
    @postquery = Post.ransack(params[:q])
    @posts = @postquery.result.page(params[:page]).per(16)
  end
end
