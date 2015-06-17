class OrdersController < ApplicationController

  before_action :set_order, except:[:new, :create, :index]
  before_action :authenticate_user!, except:[:new]
  #before_action :previous_page

  def new
    @order = Order.new
  end

  def create
    @order = Order.create(order_params)
    if @order.save
      flash[:success] = 'New Order Added!'
      redirect_to orders_path
    else
      flash[:danger] = 'Failed!'
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(Order_params)
      flash[:success] = 'Order Updated!'
      redirect_to orders_path
    else
      flash[:danger] = 'Failed!'
      render :edit
    end      
  end

  def index
    @orders = Order.all.order('updated_at DESC')
  end

  def show
  end

  def destroy
    if @order.destroy
      flash[:success] = 'Order Deleted!'
    else
      flash[:danger] = 'Failed!'
    end
    redirect_to orders_path
  end

  private
  def order_params
    params.require(:order).permit(:user_id, :location_id, :restaurant_id, :food_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
