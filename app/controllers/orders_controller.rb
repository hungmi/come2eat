class OrdersController < ApplicationController

  before_action :set_order, except:[:new, :create, :index]
  before_action :authenticate_user!, except:[:new]
  #before_action :previous_page

  def new
    if current_user
      @order = current_user.orders.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @order = current_user.orders.create(order_params)
    if @order.save
      #flash[:success] = 'New Order Added!'
      redirect_to edit_order_path(@order)
    else
      flash[:danger] = 'Failed!'
      render :new
    end
  end

  def edit
    @foods = Food.all
  end

  def update
    if @order.update(order_params)
      flash[:success] = 'Order Updated!'
      redirect_to order_path(@order)
    else
      flash[:danger] = 'Failed!'
      render :edit
    end
  end

  def index
    @orders = current_user.orders.order('updated_at DESC')
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
    params.require(:order).permit(:user_id, :location_id, :restaurant_id, :food_id, :description)
  end

  def fooditem_params
    params.require(:fooditem).permit(:food_id, :order_id, :restaurant_id, :quantity)
  end

  def set_order
    @order = current_user.orders.find(params[:id])
  end

end
