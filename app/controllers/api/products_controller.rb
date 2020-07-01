class Api::ProductsController < ApplicationController

  def product
    @product = Product.first
    render "product.json.jb"
  end

  def products
    @products = Product.all
    render "products.json.jb"
  end
end
