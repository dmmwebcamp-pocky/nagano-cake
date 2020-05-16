class Admin::ProductsController < ApplicationController
	#before_action :if_not_admin #管理者以外が特定のアクションを実行した場合には、TOPへリダイレクト

	def	index
		@products = Product.all
		@product = Product.find(params[:id])
	end

	def	show
	end

	def	new
		@product = Product.new
	end

	def	create
		@product = Product.new(product_params)
		@product.save
		redirect_to root_path
	end

	def	edit
	end

	def update	
	end

	private
		#def if_not_admin
		#redirect_to "/admin/top" unless current_customer.admin?
		#end

		def product_params
			params.require(:product).permit(:image, :product_name, :explanation, :genre_id, :nontax, :sales_status)
		end
end
