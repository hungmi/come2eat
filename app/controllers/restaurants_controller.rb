class RestaurantsController < ApplicationController
  layout "restaurant/application"
  before_action :authenticate_restaurant!
end