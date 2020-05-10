class RegistrationsController < ApplicationController
  skip_before_action :login_required
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.image = 'no-image.png'
    if @user.save
      redirect_to wishes_path, notice: 'アカウント登録完了しました'
    else
      flash.now[:alert] = 'アカウント登録に失敗しました'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
