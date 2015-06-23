class CreateFooditems < ActiveRecord::Migration
  def change
    create_table :fooditems do |t|
      t.references :food, index: true, foreign_key: true
      t.references :order, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
