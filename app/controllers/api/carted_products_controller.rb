class Api::CartedProductsController < ApplicationController
  
  def index
    if current_user
      @carted_products = current_user.cart
      render "index.json.jbuilder"
    else
      render json: [], status: :unauthorized
    end
  end

  def create

    @carted_product = CartedProduct.new(
                                        user_id: current_user.id,
                                        product_id: params[:product_id],
                                        quantity: params[:quantity],
                                        status: "carted"
                                        )
    if @carted_product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @carted_product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @carted_product = CartedProduct.find(params[:id])
    @carted_product.update(status: "removed")
    render json: {status: "Product was removed from cart"}
  end
end
