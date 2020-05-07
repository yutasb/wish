class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(wish_id: params[:wish_id])
    favorite.save
    redirect_to wishes_path
  end

  def destroy
    favorite = Favorite.find_by(wish_id: params[:wish_id], user_id: current_user.id)
    favorite.destroy
    redirect_to wishes_path
  end
end
