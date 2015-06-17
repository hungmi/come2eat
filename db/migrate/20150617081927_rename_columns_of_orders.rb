class RenameColumnsOfOrders < ActiveRecord::Migration
  def change
    rename_column :orders, :user_id_id, :user_id
    rename_column :orders, :location_id_id, :location_id
    rename_column :orders, :restaurant_id_id, :restaurant_id
    rename_column :orders, :food_id_id, :food_id
  end
end
