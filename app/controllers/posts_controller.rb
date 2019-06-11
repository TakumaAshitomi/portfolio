class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end
  
  def index 
    @posts = Post.page(params[:page]).per(8)
  end
end
