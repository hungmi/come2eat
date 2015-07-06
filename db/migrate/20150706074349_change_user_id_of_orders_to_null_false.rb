class ChangeUserIdOfOrdersToNullFalse < ActiveRecord::Migration
  def change
    change_column :orders, :user_id, :integer, null: false
  end
end
