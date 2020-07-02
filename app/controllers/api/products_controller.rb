class Api::ProductsController < ApplicationController

  def product
    @product = Product.first
    render "product.json.jb"
  end

  def products
    @products = Product.all
    render "products.json.jb"
  end

  def single_product
    id = params['id']
    @product = Product.find_by(id: id)
    render 'single_product.json.jb'
  end
end
