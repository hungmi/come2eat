class MoveRestaurantIdFromFooditemsToOrders < ActiveRecord::Migration
  def change
    remove_index  :fooditems, :restaurant_id
    remove_column :fooditems, :restaurant_id
    
    change_table :orders do |t|
      t.references :restaurant, index: true, foreign_key: true
    end
  end
end
