class Api::OrdersController < ApplicationController
  # before_action :authenticate_user, only: [:index, create]
  def index
    @orders = current_user.orders
    @orders = Order.all
    render "index.json.jbuilder"
  end

  def create
    @order = Order.new(
                        user_id: params[:user_id]
                       )

    @order.build_totals

    if @order.save
      render "show.json.jbuilder"
    else
      render json: { errors: @orders.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
