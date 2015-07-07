class Order < ActiveRecord::Base

  scope :recent, -> { order('updated_at DESC') }

  belongs_to :user
  belongs_to :location

  has_many :fooditems, dependent: :destroy

  accepts_nested_attributes_for :fooditems,
    :allow_destroy => true,
    reject_if: :reject_fooditems

  validate :fooditems_available?
  validates_presence_of :name

  def reject_fooditems(attributes)
    attributes['restaurant_id'].blank? || attributes['quantity'].blank? || attributes['food_id'].blank?
  end

  def fooditems_available?
    if fooditems.empty?
      errors[:base] << 'No fooditems present'
      false
    else
      true
    end
  end
end
