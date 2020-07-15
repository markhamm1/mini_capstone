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
    product = Product.find_by(id: params[:product_id])

    calculated_subtotal = params[:quantity].to_i * product.price

    tax_rate = 0.09
    calculated_tax = calculated_subtotal * tax_rate
    calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
    user_id: current_user.id,
    product_id: params[:product_id],
    quantity: params[:quantity],
    subtotal: calculated_subtotal,
    tax: calculated_tax,
    total: calculated_total
    )
    # @order.subtotal = @order.product.price * @order.quantity
    # @order.tax = @order.product.tax * @order.quantity
    # @order.total = @order.subtotal + @order.tax
    @order.save
    render 'show.json.jb'
  end
end
