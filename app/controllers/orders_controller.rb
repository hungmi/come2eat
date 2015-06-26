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
    @order = current_user.orders.new(order_params)
    if @order.save
      flash[:success] = 'New Order Added!'
      redirect_to edit_order_path(@order)
    else
      flash[:danger] = 'Failed!'
      render :new
    end
  end

  def edit
    #@foods = Food.all
    #@fooditem = @order.fooditems.new
    #@fooditems = @order.fooditems
  end

  def update
    if @order.update(order_params)
      flash[:success] = 'Order Updated!'
      render :edit
    else
      flash[:danger] = 'Failed!'
      render :edit
    end
  end

  def index
    @orders = current_user.orders.order('updated_at DESC')
  end

  def show; end

  def destroy
    if @order.destroy
      flash[:success] = 'Order Deleted!'
    else
      flash[:danger] = 'Failed!'
    end
    redirect_to orders_path
  end

  def create_fooditem
    @fooditem = @order.fooditems.create({"food_id"=>"1", "restaurant_id"=>"1", "order_id"=>"28"})
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

end
