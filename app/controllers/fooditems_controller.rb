class FooditemsController < ApplicationController

  def new
    @order = Order.find(params[:order_id])
    @fooditem = @order.fooditems.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    @fooditem = Fooditem.find(params[:id])
    if @fooditem.update(fooditem_params)
      flash[:success] = 'Update successfully!'
      redirect_to orders_path
    else
      flash[:warning] = 'failed'
    end
  end

  def destroy
    @order = Order.find(params[:order_id])
    @fooditem = @order.fooditems.find(params[:id])
    if @fooditem.destroy
      flash[:success] = 'remove successfully!'
      redirect_to edit_order_path(@order.id)
    else
      flash[:warning] = 'failed'
    end
  end

  def create
    @order = Order.find(params[:order_id])
    @food = Food.find(params[:food_id])
    @fooditem = @order.fooditems.build({ restaurant: @food.restaurant, food: @food })
    if @fooditem.save
      flash[:success] = 'Add successfully!'
      redirect_to edit_order_path(@order.id)
    else
      flash[:warning] = 'failed'
    end
  end

  private

  def fooditem_params
    params.require(:fooditem).permit(:food_id, :order_id, :restaurant_id, :quantity)
  end

end
