class FavoritesController < ApplicationController
  def create
    @wish = Wish.find(params[:wish_id])
    favorite = current_user.favorites.build(wish_id: params[:wish_id])
    favorite.save

  end

  def destroy
    @wish = Wish.find(params[:wish_id])
    favorite = Favorite.find_by(wish_id: params[:wish_id], user_id: current_user.id)
    favorite.destroy

  end
end
