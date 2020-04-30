class OtherpagesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @wishes = @user.wishes.where(user_id: params[:id])
  end
end
