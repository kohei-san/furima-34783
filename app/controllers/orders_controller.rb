class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_item_info #出品者のアクセス制限、商品情報表示、商品価格取得のために必要
  before_action :customer?
  before_action :no_order_for_sold

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      pay_item
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def get_item_info
    @item = Item.find(params[:item_id])
  end

  def customer?
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def no_order_for_sold
    unless @item.order.nil?
      if @item.id == @item.order.item_id
        redirect_to root_path
      end
    end
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number)
    .merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_dd139aec27e0fd8996c04ef9"
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
