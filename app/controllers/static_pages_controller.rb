# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @query = Post.ransack(params[:q])
    @posts = Post.last(5)
  end
end
