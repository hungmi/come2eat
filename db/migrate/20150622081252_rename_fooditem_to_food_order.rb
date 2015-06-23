class RenameFooditemToFoodOrder < ActiveRecord::Migration
  def change
    rename_table :food_items, :food_orders
  end
end
