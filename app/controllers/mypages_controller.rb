class MypagesController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_path(@user), notice: '更新しました'
    else
      flash[:alert] = '更新できませんでした'
      render :edit
    end
  end

  def show
    @user = current_user.id
    @wishes = Wish.where(user_id: current_user)
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:myself)
  end
end

