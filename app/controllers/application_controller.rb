class ApplicationController < ActionController::Base
    protect_from_forgery with: :null_session
    helper_method :current_user
    before_action :login_required

    private

    def current_user
        @current_user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
        redirect_to sign_in_path unless current_user
    end
end
