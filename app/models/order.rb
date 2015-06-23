class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
  has_many :fooditems, dependent: :destroy
end
