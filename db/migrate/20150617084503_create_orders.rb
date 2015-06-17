class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.references :user, index: true
      t.references :location, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end
