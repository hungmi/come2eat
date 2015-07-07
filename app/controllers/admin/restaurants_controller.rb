class Admin::RestaurantsController < AdminController
  before_filter :find_restaurant

  def index
    @restaurants = Restaurant.all
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:success] = 'Restaurant Updated!'
      redirect_to admin_restaurants_path
    else
      flash[:danger] = 'Failed!'
      render :edit
    end
  end

  private

  def find_restaurant
    @restaurant = Admin::Restaurant.find(params[:id]) if params[:id]
  end

  def restaurant_params
    params.require(:restaurant).permit(:name)
  end
end