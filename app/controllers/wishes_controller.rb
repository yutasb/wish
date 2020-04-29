class WishesController < ApplicationController
  def new
  end

  def index
    @user = current_user.id
    
  end

  def show
  end

  def edit
  end
end
