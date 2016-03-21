class OrdersController < ApplicationController

  before_action :authenticate_user!, except:[:new]
  before_action :set_order, except:[:new, :create, :index]
  before_action :get_restaurants, only:[:new, :create, :edit]
  #before_action :previous_page

  def new
    if user_signed_in?
      @order = current_user.orders.new
    else
      @order = Order.new
    end
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      flash[:notice] = 'New Order Added!'
      redirect_to order_path(@order)
    else
      flash[:alert] = @order.errors.full_messages
      @fooditem = @order.fooditems.new
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:notice] = 'Order Updated!'
      redirect_to order_path(@order)
    else
      flash[:alert] = 'Failed!'
      render :edit
    end
  end

  def index
    @orders = current_user.orders.order('updated_at DESC')
  end

  def show
    @fooditems = @order.fooditems
  end

  def destroy
    if @order.destroy
      flash[:notice] = 'Order Deleted!'
    else
      flash[:alert] = 'Failed!'
    end
    redirect_to orders_path
  end

  def create_fooditem
    @fooditem = @order.fooditems.create(fooditem_params)
    @fooditem.save
  end

  private
  def order_params
    params.require(:order).permit(:name, :user_id, :location_id, :description, fooditems_attributes: [:id, :food_id, :restaurant_id, :quantity, :_destroy])
  end

  def fooditem_params
    #params.require(:fooditem).permit(:id, :food_id, :restaurant_id, :quantity, :_destroy)
    params.permit(:id, :order_id, :food_id, :restaurant_id, :quantity, :_destroy)
  end

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def get_restaurants
    @restaurants = Restaurant.all
  end

end
