class Product < ApplicationRecord
  def is_discounted?
    discounted = false
    if price < 2
      discounted = true
    end
    discounted
  end
  
end
