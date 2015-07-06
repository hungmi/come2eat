class Order < ActiveRecord::Base

  scope :recent, -> { order('updated_at DESC') }

  belongs_to :user
  belongs_to :location
  before_save :fooditems_available?
  has_many :fooditems, dependent: :destroy
  accepts_nested_attributes_for :fooditems,
    :allow_destroy => true,
    reject_if: :reject_fooditems

  def reject_fooditems(attributes)
    attributes['restaurant_id'].blank? || attributes['quantity'].blank? || attributes['food_id'].blank?
  end

  def fooditems_available?
    if fooditems.empty?
      errors.add(:base, 'Line Items present')
      false
    else
      true
    end
  end
end
