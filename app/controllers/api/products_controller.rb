class Api::ProductsController < ApplicationController

  def product
    render "product.json.jb"
  end

  def products
    render "products.json.jb"
  end
end
