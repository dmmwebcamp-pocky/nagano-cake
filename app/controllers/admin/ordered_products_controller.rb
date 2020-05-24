class Admin::OrderedProductsController < ApplicationController
	def update
  		@ordered_product = OrderedProduct.find(params[:id])
  		@ordered_product.update(ordered_product_params)
  		@order = @ordered_product.order
  			if @ordered_product.read_attribute_before_type_cast(:production_status) == 2#2:製作中にしたら注文ステータスを2:製作中にする
  				 	@order.update(order_status: 2)
  			elsif @order.ordered_products.count == @order.ordered_products.where(production_status: "製作完了").count#3:製作完了にしたら注文ステータスを3:発送準備中にする
  					@order.update(order_status: 3)
			 end
  		redirect_to admin_order_path(@order)
  	end

  	private
	def ordered_product_params
		params.require(:ordered_product).permit(:production_status)
	end
end
