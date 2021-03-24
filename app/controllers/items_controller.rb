class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :move_to_index, only:[:edit, :update, :delete]
  before_action :find_item, only:[:show, :edit, :update]
  
  def index
    @items = Item.order("created_at DESC")
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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :schedule_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user.id 
    else
      redirect_to root_path
    end
  end

end
