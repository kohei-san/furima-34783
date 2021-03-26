class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :customer?

  def index
  end

  def create
    @order = Order.create(order_params)
    Address.create(address_params)
    pay_item
    redirect_to root_path
  end

  private

  def customer?
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id, token: params[:token], price: @item.price)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: @order.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_dd139aec27e0fd8996c04ef9"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
