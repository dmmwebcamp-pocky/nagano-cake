class Admin::ProductsController < ApplicationController
	#before_action :if_not_admin #管理者以外が特定のアクションを実行した場合には、TOPへリダイレクト

	def	index
		@products = Product.all.page(params[:page]).per(10)#１ページ10件表示
		@genres = Genre.all

	end

	def	show
		@product = Product.find(params[:id])
	end

	def	new
		@product = Product.new
	end

	def	create
		@product = Product.new(product_params)
		if @product.save
		redirect_to admin_product_path(@product)
		else render :new
		end
	end

	def	edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
			redirect_to admin_product_path(@product)
		else render :edit
		end
	end

	private
		#def if_not_admin
		#redirect_to "/admin/top" unless current_customer.admin?
		#end

		def product_params
			params.require(:product).permit(:image, :product_name, :explanation, :genre_id, :nontax, :sales_status)
		end
end
