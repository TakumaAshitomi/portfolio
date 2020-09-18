# frozen_string_literal: true

class StaticPagesController < ApplicationController
  def home
    @query = Post.ransack(params[:q])
    @recentposts = Post.last(5)
  end
end
