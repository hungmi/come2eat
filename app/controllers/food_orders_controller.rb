class FoodOrdersController < ApplicationController
  def create
    @order = Order.find(params[:order_id])
    @food_order = @order.food_orders.create(food_order_params)
    if @food_order.save
      flash[:success] = 'One Food Add to Order!'
      redirect_to orders_path
    else
      flash[:danger] = 'Failed!'
      #render :new
    end
  end

  private

  def food_order_params
    params.require(:food_order).permit(:order_id, :food_id)
  end
end
