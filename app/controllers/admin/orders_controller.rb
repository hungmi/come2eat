class Admin::OrdersController < AdminController

  before_action :set_order, except:[:new, :create, :index]

  def index
    @orders =
    case params[:mode]
    when nil then Order.order(:user_id).recent
    when 'restaurants' then Order.all
    when 'locations' then Order.order(:location_id).recent
    end
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

  private
  def order_params
    params.require(:order).permit(:location_id, :restaurant_id, :food_id, :description)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
