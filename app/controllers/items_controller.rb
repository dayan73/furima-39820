class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @items = Item.order(created_at: :desc) 
  end

  def new
    @item = Item.new
  end
 
  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params) 
  
    if @item.save 
      redirect_to root_path

    else
      render :new, status: :unprocessable_entity
    end    
  
  end

  #def edit
    #@item = Item.edit
  #end

  #def delite
    #@item = Item.delite
  #end


 private

 def item_params
  params.require(:item).permit(:image, :trade_name, :description, :price, :state_id, :postage_id, :region_id, :transit_time_id, :category_id).merge(user_id: current_user.id)
end

end
