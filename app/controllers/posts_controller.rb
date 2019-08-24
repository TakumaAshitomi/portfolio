# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :sign_in_required, only: %i[new create edit update destoroy]

  def show
    @post = Post.find(params[:id])
  end

  def index
    @query = Post.ransack(params[:q])
    @posts = if params[:tag_name]
               Post.all.tagged_with(params[:tag_name].to_s).page(params[:page]).per(8)
             else
               @query.result.page(params[:page]).per(8)
             end
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
    if can? :update, @post
      @post.update_attributes(post_params)
      if @post.save
        flash[:notice] = "変更しました。"
        redirect_to "/posts/#{@post.id}"
      else
        flash[:notice] = "変更に失敗しました"
        render "edit"
      end
    else
      flash[:notice] = "権限がありません"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if can? :destroy, @post
      if @post.destroy
        flash[:notice] = "削除しました"
        redirect_to "/users/#{current_user.id}"
      else
        flash[:notice] = "削除に失敗しました"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:notice] = "権限がありません。"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :description, :tag_list)
  end

  def sign_in_required
    unless user_signed_in?
      flash[:notice] = "ログインしてください。"
      redirect_to new_user_session_url
    end
  end
end
