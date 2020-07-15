class Api::OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end
  
  def create
    @order = Order.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    )
    @order.subtotal = @order.product.price * @order.quantity
    @order.tax = @order.product.tax * @order.quantity
    @order.total = @order.subtotal + @order.tax
    @order.save
    render 'show.json.jb'
  end
end
