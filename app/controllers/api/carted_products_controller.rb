class Api::CartedProductsController < ApplicationController
  
  def index
    @carted_products = CartedProduct.where(user_id: current_user.id, status: 'carted')
    render 'index.json.jb'  
  end

  def create
    @carted_product = CartedProduct.create(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    p @carted_product.errors.full_messages
    render 'show.json.jb'
  end
end
