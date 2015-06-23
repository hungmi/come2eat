class Fooditem < ActiveRecord::Base
  belongs_to :food
  belongs_to :order
  belongs_to :restaurant
end
