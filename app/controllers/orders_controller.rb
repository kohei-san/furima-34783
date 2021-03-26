class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :customer?

  def index
  end

  def create
    binding.pry
    @order = Order.create(order_params)
    Address.create(address_params)
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
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: @order.id)
  end
end
