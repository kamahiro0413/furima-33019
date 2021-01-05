class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, except: [:index,:show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
     if @item.update(item_params)
      redirect_to @item
     else
      render :edit
     end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :shipping_cost_id, :prefecture_id,
                                 :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
     redirect_to action: :index
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
