class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render "all_products_view.json.jbuilder"
  end

  def first_product_action
    @product = Product.first
    render "first_product_view.json.jbuilder"
  end

  def second_product_action
    @product = Product.find_by(id: 2)
    render "second_product_view.json.jbuilder"
  end

  def last_product_action
    @product = Product.last
    render "last_product_view.json.jbuilder"
  end
end
