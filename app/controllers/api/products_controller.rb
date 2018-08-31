class Api::ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @products = Product.all
    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            image_url: params[:image_url],
                            attunement: params[:attunement]
                            )
    @product.save
    render "show.json.jbuilder"
  end

  def show
    @product = Product.find(params[:id])
    render "show.json.jbuilder"
  end

  def update
    @product = Product.find(params[:id])

    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    @product.image_url = params[:image_url] || @product.image_url
    @product.attunement = params[:attunement] || @product.attunement

    @product.save
    render "show.json.jbuilder"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Fucking Annihilated!"}
  end
end
