class Api::OrdersController < ApplicationController
  before_action :authenticate_user
  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    carted_products = current_user,cart
    @order = Order.new(user_id: current_user.id)

    @order.calculate_subtotal
    @order.tax = subtotal * 0.09
    @order.total = @order.subtotal + @order.tax

    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(
                        user_id: params[:user_id]
                       )
    @order.save

    carted_products.update.all(status: "purchased", order_id: @order_id)

    # if @order.save
    render "show.json.jbuilder"
    # else
    #   render json: { errors: @orders.errors.full_messages }, status: :unprocessable_entity
    # end
  end
end
