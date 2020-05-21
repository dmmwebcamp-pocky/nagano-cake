class HomeController < ApplicationController

  def top
  	@products = Product.all
  	@genres = Genre.all
  end

  def search
  	@genres = Genre.all
	@products = Product.where(genre_id: params[:genre_id].to_i).page(params[:page]).per(8)
  end

protected

  def product_params
    params.require(:product).permit(:image, :product_name, :explanation, :genre_id, :nontax, :sales_status)
  end


end
