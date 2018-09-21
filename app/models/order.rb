class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products


  def calculate_subtotal
    products_subtotal = 0
    carted_products.each do |carted_product|
      products_subtotal = carted_product.product.price = carted_product.quantity
    end
    self.subtotal = products_subtotal
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calculate_total
    self.total = subtotal + tax
  end

  def build_totals
    calculate_subtotal
    calculate_tax
    calculate_total
  end
end
