class MypagesController < ApplicationController
  def edit
    @user = current_user.id
  end

  def show
    @user = current_user.id
    @wishes = Wish.where(user_id: current_user)
  end
end
