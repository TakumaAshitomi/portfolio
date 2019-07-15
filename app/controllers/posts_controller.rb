class PostsController < ApplicationController
  before_action :sign_in_required, only: [:new,:create,:edit,:update,:destoroy]
  
  def show
    @post = Post.find(params[:id])
  end
  
  def index 
    @query = Post.ransack(params[:q])
    @posts = @query.result.page(params[:page]).per(8)
  end
  
  def new 
    @post = Post.new
  end

  def create
    @post.user_id = current_user.id if @post = Post.new(post_params)
    if @post.save
      @post.create_activity :create, owner: current_user
      flash[:notice] = "作成しました。"
      redirect_to "/posts"
    else
      render "new"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end  
  
  def update
    @post = Post.find(params[:id])
    @post.update_attributes(post_params)
    @post.save
    flash[:notice] = "変更しました。"
    redirect_to "/posts/#{@post.id}"
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "削除しました"
    redirect_to "/users/#{current_user.id}"
  end

  private
  
    def post_params
      params.require(:post).permit(:title,:description)
    end
    
    def sign_in_required
      unless user_signed_in?
        flash[:notice] = "ログインしてください。"
        redirect_to new_user_session_url 
      end
    end
end
