class PagesController < ApplicationController
  skip_before_action :login_required
  def home
    render layout: false # application.html.erbを適用したくない
  end
end
