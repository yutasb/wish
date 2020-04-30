class WishesController < ApplicationController
  def new
    @wish = Wish.new
  end

  def create
    @wish = current_user.wishes.new(wish_params)
    if @wish.save
        redirect_to wishes_path, notice:'登録しました'
    else
      render :new
    end

  end

  def index
    @user = current_user.id
    @wishes = Wish.all
  end

  def show
    @wish = Wish.find(params[:id])
  end

  def edit
    @wish =Wish.find(params[:id])
  end

  def update
    @wish = Wish.find(params[:id])
    if @wish.update(wish_params)
      redirect_to wish_path(@wish), notice:'更新しました'
    else
      flash.noe[:alert] = '更新できませんでした'
      render :edit
    end
  end

  private

  def wish_params
    params.require(:wish).permit(:title,:description,:description_link1,:description_link2,:description_link3)
  end
end
