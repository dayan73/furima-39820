class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
  end

  def new
    @item = Item.new
  end
 
  def create
    @item = Item.new(item_params) 
  
    if @item.save 
      redirect_to @item, notice: "商品を出品しました"
    else
      render 'new' 
    end
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, ...) # 必要なパラメータを追加してください
  end


end
