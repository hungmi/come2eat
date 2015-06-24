module FormHelper
  def setup_order(order)
    # order.fooditems ||= order.fooditems.build
    # above didn't work because order.fooditems = #<ActiveRecord::Associations::CollectionProxy []>
    #   which is not nil
    2.times { order.fooditems.build }# if order.fooditems.size == 0
    order
  end
end