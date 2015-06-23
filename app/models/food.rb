class Food < ActiveRecord::Base
  belongs_to :restaurant
  has_many :fooditems

  before_destroy :ensure_not_referenced_by_any_food_item

  validates :restaurant_id, presence: true

  private
    def ensure_not_referenced_by_any_food_item
      if food_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end     
    end
end
