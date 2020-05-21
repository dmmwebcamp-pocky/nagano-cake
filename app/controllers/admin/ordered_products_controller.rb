class Admin::OrderedProductsController < ApplicationController
	def update
  		@ordered_products = OrderedProduct.find(params[:id])
  		@ordered_products.update(ordered_products_params)
  	end

  	private
	def ordered_products_params
		params.require(:ordered_products).permit(:production_status)
	end
end
