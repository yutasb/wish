class UsersController < ApplicationController
  def index
    @users = User.all
     @search = User.ransack(params[:q])
     @users = @search.result
  end
end
