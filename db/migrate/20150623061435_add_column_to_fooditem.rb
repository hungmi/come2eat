class AddColumnToFooditem < ActiveRecord::Migration
  def change
    add_column :fooditems, :quantity, :integer
  end
end
