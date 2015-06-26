class Restaurants::OrdersController < RestaurantsController
  def index
    @orders = Fooditem.where(restaurant_id: current_restaurant.id)
  end
end
