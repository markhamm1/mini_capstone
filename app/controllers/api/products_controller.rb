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

    p "*" * 88
    p current_user

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
      description: params[:description],
      supplier_id: params[:supplier_id]
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
    @product.update(
      name: params[:name] || @product.name,
      price: params[:price] || @product.price,
      description: params[:description] || @product.description,
      supplier_id: params[:supplier_id] || @product.supplier_id,
    )
    @product.save
    if @product.save
      Image.create(url: params[:image_url], product_id: @product.id)
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
