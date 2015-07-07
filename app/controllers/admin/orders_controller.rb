class Admin::OrdersController < AdminController

  before_action :set_order, except:[:new, :create, :index, :by_restaurants, :by_locations]

  def index
    @orders = Order.order(:user_id).recent
  end

  def update
    if @order.update(order_params)
      flash[:success] = 'Order Updated!'
      redirect_to admin_orders_path
    else
      flash[:danger] = 'Failed!'
      render :edit
    end  
  end

  def show
    @fooditems = Fooditem.where(order_id: @order)
  end

  def destroy
  end

  def by_restaurants
    @restaurants = Restaurant.all
  end

  def by_locations
    @locations = Location.all
  end

  private
  def order_params
    params.require(:order).permit(:location_id, :restaurant_id, :food_id, :description)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
