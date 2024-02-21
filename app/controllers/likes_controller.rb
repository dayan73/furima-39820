class LikesController < ApplicationController
  #before_action :set_item
  
  def create
    like = current_user.likes.create(item_id: params[:item_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    like.destroy
    respond_to do |format|
      format.js
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end