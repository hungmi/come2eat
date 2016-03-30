class AddStateToFoodAndOrder < ActiveRecord::Migration
  def change
  	add_column :foods, :food_state, :integer
  	add_column :orders, :order_state, :integer
  end
end

