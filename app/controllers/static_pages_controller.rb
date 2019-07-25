class StaticPagesController < ApplicationController
  def home
    @query = Post.ransack(params[:q])
  end
  
end
