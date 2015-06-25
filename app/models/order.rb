class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :fooditems, dependent: :destroy
  accepts_nested_attributes_for :fooditems,
    :allow_destroy => true,
    reject_if: :reject_fooditems

  def reject_fooditems(attributes)
    attributes['restaurant_id'].blank? || attributes['quantity'].blank? || attributes['food_id'].blank?
  end
end
