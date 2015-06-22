class Restaurants::FoodsController < RestaurantsController

  before_action :set_food, except: [:new, :create, :index]

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
    if @food.update(food_params)
      flash[:success] = 'Food Updated!'
      redirect_to restaurant_foods_path
    else
      flash[:danger] = 'Failed!'
      render :edit
    end
  end

  def index
    @foods = current_restaurant.foods
  end

  def show
  end

  def destroy
    if @food.destroy
      flash[:success] = 'Food Deleted!'
      redirect_to restaurant_foods_path
    else
      flash[:danger] = 'Failed!'
      render :index
    end    
  end

  private
  def food_params
    params.require(:food).permit(:name)
  end
  def set_food
    @food = current_restaurant.foods.find(params[:id])
  end
end
