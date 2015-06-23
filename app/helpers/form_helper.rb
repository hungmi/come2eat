module FormHelper
  def setup_order(order)
    # ... code from above omitted
 
    3.times { order.fooditems.build }
    order
  end
end