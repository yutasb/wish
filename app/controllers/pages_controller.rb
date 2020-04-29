class PagesController < ApplicationController
    skip_before_action :login_required
    def home
        @user = current_user.id
        render layout: false #application.html.erbを適用したくない
    end

end
