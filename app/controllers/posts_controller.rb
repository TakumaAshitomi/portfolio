class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def index 
    @posts = Post.page(params[:page]).per(8)
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
  
  private
    def post_params
      params.require(:post).permit(:title,:description)
    end
end
