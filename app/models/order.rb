class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :fooditems, dependent: :destroy
<<<<<<< HEAD
  accepts_nested_attributes_for :fooditems,
    :allow_destroy => true,
    reject_if: :reject_fooditems

  def reject_fooditems(attributes)
    attributes['quantity'].blank? || attributes['food_id'].blank? || attributes['restaurant_id'].blank?
  end

=======
>>>>>>> parent of 1481ee6... add accept_nested_attributes_for fooditems in order.rb
end
