class Admin::OrdersController < ApplicationController
  def index
  	@orders = Order.all
  end

  def show
  	@order = Order.find(params[:id])
  	@ordered_products = @order.ordered_products
  	@total = 0
  	@ordered_products.each do |ordered_product|
  	@total += ordered_product.quantity * ordered_product.product_tax
  	end
  end

  def update
  	@order = Order.find(params[:id])
  	@ordered_products = @order.ordered_products
	@order.update(order_params)
  	if @order.read_attribute_before_type_cast(:order_status) == 1#1:入金確認したら製作ステータスを1:製作待ちにする
  		@ordered_products.each do |ordered_product|
  			ordered_product.update(production_status: 1)
  		end
  	end
  	redirect_to request.referer
  end

  private
  	def order_params
  		params.require(:order).permit(:order_status)
  	end
end
