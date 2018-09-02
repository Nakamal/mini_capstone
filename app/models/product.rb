class Product < ApplicationRecord
  def is_discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    "Your out the door cost will be a total of #{price} + #{tax}"
  end
end
