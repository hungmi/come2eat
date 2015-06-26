class Fooditem < ActiveRecord::Base
  belongs_to :food
  belongs_to :order
  belongs_to :restaurant

  # NOTICE: NO browser validations without these validations
  validates :restaurant_id, presence: true
  validates :food_id, presence: true
  validates :quantity, presence: true
  # if we validate order_id at orders#new, will error: fooditems order can't be blank.
  #   although we don't validate order_id, it'll still be present because of the relationship we create.
  #validates :order_id, presence: true
end
