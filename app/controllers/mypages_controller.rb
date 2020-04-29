class MypagesController < ApplicationController
  def edit
    @user = current_user.id
  end

  def show
    @user = current_user.id
  end
end
