class Restaurant::FoodsController < RestaurantsController
  def new
    if current_restaurant
      @food = current_restaurant.foods.new
    else
      redirect_to new_restaurant_session_path
    end
  end

  def create
    @food = current_restaurant.foods.create(food_params)
    if @food.save
      flash[:success] = 'New Food Added!'
      redirect_to restaurant_foods_path
    else
      flash[:danger] = 'Failed!'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def index
    @foods = current_restaurant.foods
  end

  def show
  end

  def destroy
  end

  private
  def food_params
    params.require(:food).permit(:name)
  end
  def set_food
    @food = Food.find(params[:id])
  end
end
