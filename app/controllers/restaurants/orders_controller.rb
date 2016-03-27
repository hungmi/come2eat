class Restaurants::OrdersController < RestaurantsController
  def index
    @orders = current_restaurant.orders.includes(:fooditems)
  end
end
