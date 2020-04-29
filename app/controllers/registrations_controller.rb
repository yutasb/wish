class RegistrationsController < ApplicationController
  skip_before_action :login_required
  def new
    # @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to wishes_path, notice:'アカウント登録完了しました'
    else
      flash.now[:alert] = 'アカウント登録に失敗しました'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
