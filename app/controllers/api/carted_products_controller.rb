class Api::CartedProductsController < ApplicationController
  
  def index
    if current_user
      @carted_products = current_user.carted_products
      render "index.json.jbuilder"
    else
      render json: [], status: :unauthorized
    end
  end

  def create

    @carted_product = CartedProduct.new(
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quantity: params[:quantity]
                                        )
    if @carted_product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
