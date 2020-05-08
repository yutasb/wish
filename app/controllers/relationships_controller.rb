class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:mypage_id])
    follow = current_user.active_relationships.build(follower_id: params[:mypage_id])
    follow.save
    redirect_to otherpage_path(@user) ,notice:'フォローしました'
  end

  def destroy
    @user = User.find(params[:mypage_id])
    follow = current_user.active_relationships.find_by(follower_id: params[:mypage_id])
    follow.destroy
    redirect_to otherpage_path(@user),alert:'フォロー解除しました'
  end
end
