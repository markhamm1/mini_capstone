class Api::CategoryproductsController < ApplicationController
  def show
    @categoryproduct = CategoryProduct.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @categoryproduct = CategoryProduct.new(
      product_id: params[:product_id],
      category_id: params[:category_id]
    )
    @categoryproduct.save
    render 'show.json.jb'
  end
  
  def update
    @categoryproduct = CategoryProduct.find_by(id: params[:id])
    @categoryproduct.update(
      product_id: params[:product_id] || @categoryproduct.product_id,
      category_id: params[:category_id] || @categoryproduct.category_id
    )
    @categoryproduct.save
    render 'show.json.jb'
  end

  def destroy
    @categoryproduct = CategoryProduct.find_by(id: params[:id])
    render json: {message: "The record has been deleted"}    
  end
end
