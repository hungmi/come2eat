class Food < ActiveRecord::Base
  belongs_to :restaurant
  has_many :orders, through: :food_order
end
