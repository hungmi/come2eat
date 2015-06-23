class CreateFoodItems < ActiveRecord::Migration
  def change
    create_table :food_items do |t|
      t.references :order, index: true
      t.references :food, index: true

      t.timestamps null: false
    end
  end
end
