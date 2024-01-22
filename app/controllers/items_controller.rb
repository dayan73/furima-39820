class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end
 
  def create
    @item = Item.new(item_params) 
  
    if @item.save 
      redirect_to @item 
    else
      render 'new' 
    end
  end

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end


end
