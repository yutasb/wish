class RelationshipsController < ApplicationController
  # before_action :set_user

  def create
    @user = User.find(params[:follow_id])
    following = current_user.follow(@user)
    if following.save
      redirect_to wishes_path, notice: 'ユーザーをフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to wishes_path
    end
  end

  def destroy
    @follow = Relationship.find(params[:id])
    # @follow = @user.relationships.find_by(follow_id: params[:id])
    # following = current_user.unfollow(@follow)
    if @follow.destroy
      redirect_to wishes_path, notice: 'ユーザーのフォローを解除しました'
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to wishes_path
    end
  end

  private

  def set_user
    @user = User.find(params[:follow_id])
  end
end
