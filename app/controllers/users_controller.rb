class UsersController < ApplicationController
  def show
  end
  
  def index
    @user = User.all
  end
end
