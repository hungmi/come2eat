class Fooditem < ActiveRecord::Base
  belongs_to :food
  belongs_to :order
  belongs_to :restaurant

  validates :restaurant_id, presence: true
  validates :order_id, presence: true
  validates :food_id, presence: true
  validates :quantity, presence: true
end
