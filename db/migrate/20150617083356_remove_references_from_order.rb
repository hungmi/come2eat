class RemoveReferencesFromOrder < ActiveRecord::Migration
  def change
    remove_reference :orders, :location_id, index: true
    remove_reference :orders, :restaurant_id, index: true
    remove_reference :orders, :food_id, index: true
  end
end
