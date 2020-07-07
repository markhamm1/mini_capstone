class Product < ApplicationRecord
  def is_discounted?
    discounted = false
    if price < 2
      discounted = true
    end
    discounted
  end

  def tax
    tax = price * 0.09
    tax
  end
  
end
