class OrdersController < ApplicationController

  before_action :authenticate_user!, except:[:new]
  before_action :set_order, except:[:new, :create, :index]
  #before_action :previous_page

  def new
    if current_user
      @order = current_user.orders.new
    else
      # TODO：此目的為將使用者導向至登入頁面而不是上一頁
      # 正確方法應自訂devise controller
      redirect_to new_user_session_path
    end
  end

  def create
    @order = current_user.orders.new(order_params)
    if @order.save
      flash[:notice] = 'New Order Added!'
      redirect_to order_path(@order)
    else
      flash[:alert] = @order.errors.full_messages
      render :new
    end
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
