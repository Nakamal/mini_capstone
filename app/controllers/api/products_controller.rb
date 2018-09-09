class Api::ProductsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    search_term = params[:search]
    sort_attribute = params[:sort]
    sort_order = params[:sort_order]

    @products = Product.all

    if search_term 
      @products = @products.where(
                                  "name iLIKE ? OR rarity iLIKE ? OR attunement iLIKE ?",
                                  "%#{search_term}%",
                                  "%#{search_term}%",
                                  "%#{search_term}%"
                                  )
    end
    
    if sort_attribute && sort_order 
      @products = @products.order(sort_attribute => sort_order)
    elsif sort_attribute
      @products = @products.order(sort_attribute)
    end

    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
                            name: params[:name],
                            price: params[:price],
                            description: params[:description],
                            attunement: params[:attunement],
                            rarity: params[:rarity]
                            )
    if @product.save 
      render "show.json.jbuilder"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
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
    @product.attunement = params[:attunement] || @product.attunement
    @product.rarity = params[:rarity] || @product.rarity

    if @product.save
      render "show.json.jbuilder"
    else
      render json: { errors: @product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: {message: "Fucking Annihilated!"}
  end
end
