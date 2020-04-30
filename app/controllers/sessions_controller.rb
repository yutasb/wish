class SessionsController < ApplicationController
  skip_before_action :login_required
  def new
  end

  def create

    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(session_params[:password])
      #authenticateメソッドは、has_secure_passwordを記述した時に自動生成される認証のためのメソッド。引数で受け取ったパスワードをハッシュ化し、その結果がUserオブジェクト内部に保存されているdigestと一致するかを調べる。
      session[:user_id] = @user.id
      redirect_to wishes_path, notice: 'ログインしました'
    else
      flash.now[:alert] = 'メールアドレスかパスワードが正しくありません'
      render 'new'
    end
  end

  def index
    @user = User.find(params[:id])
  end

  def destroy
    reset_session
    redirect_to root_path
  end

  private
    def session_params
      params.permit(:email, :password)
    end
end
