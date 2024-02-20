class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    if @item.purchase.present? || current_user.id != @item.user_id
      redirect_to root_path
    end  
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :trade_name, :description, :price, :state_id, :postage_id, :region_id, :transit_time_id,
                                 :category_id).merge(user_id: current_user.id)
  end

  def redirect_sold_out
    redirect_to root_path if @item.sold_out?
  end


end
