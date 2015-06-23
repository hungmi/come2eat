class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :food_orders
  has_many :foods, through: :food_order
end
