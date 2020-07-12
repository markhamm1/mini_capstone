class Api::ProductsController < ApplicationController
  
  def index
    if params[:search]
      @products = Product.where("name LIKE ?", "%#{params[:search]}%")
    elsif params[:discount] == "true"
      @products = Product.where("price < 2")
    elsif params[:sort] == "price" && params[:sort_order] == "desc"
      @products = Product.all.order(:price => :desc)
    elsif params[:sort] == "price"
      @products = Product.all.order(:price)
    else
      @products = Product.all
    end
    render 'index.json.jb'
  end

  def show
    @product = Product.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description]
    )
    if @product.save
      Image.create(url: params[:image_url], product_id: @product.id)
      render 'show.json.jb'
    else
      render 'errors.json.jb', status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.name = params[:name]
    @product.price = params[:price]
    @product.image_url = params[:image_url]
    @product.description = params[:description]
    @product.save
    if @product.save
      render 'show.json.jb'
    else
      render 'errors.json.jb', status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    render json:{message: "You have successfully deleted the product."}
  end
end
