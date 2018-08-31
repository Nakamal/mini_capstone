class Api::ProductsController < ApplicationController
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jbuilder"
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
