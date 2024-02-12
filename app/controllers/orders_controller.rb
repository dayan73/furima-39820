class OrdersController < ApplicationController

  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
    end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_form).permit(:zip_code, :region_id, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end