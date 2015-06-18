class Admin::OrdersController < AdminController

  before_action :set_order, except:[:new, :create, :index]

  def index
    @orders = Order.order(:location_id).order('updated_at DESC')
  end

  def edit
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
