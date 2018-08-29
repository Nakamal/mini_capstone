class Api::ProductsController < ApplicationController
  def all_products_action
    @products = Product.all
    render "all_products_view.json.jbuilder"
  end
end
