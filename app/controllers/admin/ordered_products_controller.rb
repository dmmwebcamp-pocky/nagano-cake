class Admin::OrderedProductsController < ApplicationController
	def update
  		@ordered_products = OrderedProduct.find(params[:id])
  		@ordered_products.update(ordered_products_params)
  		@order = Order.find(params[:id])
  			if @ordered_products.read_attribute_before_type_cast(:production_status) == 2#2:製作中にしたら注文ステータスを2:製作中にする
  				 	@order.update(order_status: 2)
  			elsif @ordered_products.read_attribute_before_type_cast(:production_status) == 3#3:製作完了にしたら注文ステータスを3:発送準備中にする
  					@order.update(order_status: 3)
			end
  		redirect_to request.referer
  	end

  	private
	def ordered_products_params
		params.require(:ordered_product).permit(:production_status)
	end
end
