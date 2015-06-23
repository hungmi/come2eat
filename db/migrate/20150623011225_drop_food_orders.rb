class DropFoodOrders < ActiveRecord::Migration
  def change
    drop_table :food_orders
  end
end
