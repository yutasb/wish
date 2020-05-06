class OtherpagesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @wishes = @user.wishes.where(user_id: params[:id])
    @follow = @user.relationships.find_by(follow_id: params[:id])
  end
end
