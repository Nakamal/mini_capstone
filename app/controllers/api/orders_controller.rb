class Api::OrdersController < ApplicationController
  #before_action :authenticate_user, only: [:index, create]
  def index
    #@orders = current_user.orders
    @orders = Order.all
    render "index.json.jbuilder"
  end

  def create
    @order = Order.new(
                        user_id: params[:user_id],
                        product_id: params[:product_id],
                        quantity: params[:quantity]
                       )

    #@order.build_totals

    product = Product.find_by(id: params[:product_id])
    price = product.price
    @subtotal = price * (@order.quantity)
    @tax = (@subtotal * 0.09)
    @total = (@subtotal + @tax)

    if @order.save
      render "_orders.json.jbuilder"
      # render "show.json.jbuilder"
    else
      render json: { errors: @orders.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
