class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  	@order = OrderedProduct.all
  	# @orders.each do |order|
  	# 	@totalquantity = 0
  	# 	@totalquantity += ordered_products.quantity
  	#end
  end

  def show
  	@order = Order.find(params[:id])
  	@ordered_products = @order.ordered_products
  	@ordered_products.each do |ordered_product|
  		@total = 0
  		@total += ordered_product.quantity * ordered_product.product_tax
  	end
  end

  def update
  	@order = Order.find(params[:id])
	if @order.update(order_params)
  	redirect_to admin_orders_path
  	else render :@order
  	end
  end

  private
  	def order_params
  	params.require(:order).permit(:order_status)
  	end
end
