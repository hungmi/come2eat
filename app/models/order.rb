class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :fooditems, dependent: :destroy
  accepts_nested_attributes_for :fooditems
end
