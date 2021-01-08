class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]

  def index
    @user_purchase = UserPurchase.new 
  end

  def create
    @user_purchase = UserPurchase.new(purchase_params)
     if @user_purchase.valid?
      pay_item    
      @user_purchase.save
      redirect_to root_path
     else
      render :index
     end    
  end

    private
    def purchase_params
      params.require(:user_purchase).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_item 
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def move_to_index
      if current_user.id == @item.user_id || @item.purchase.present?
        redirect_to root_path
      end
    end
end
