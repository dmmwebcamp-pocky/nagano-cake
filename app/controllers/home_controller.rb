class HomeController < ApplicationController

  def top

    @products = Product.where(sales_status: 0).page(params[:page]).per(8)
  	@product = Product.find(Comment.group(:product_id).order('count(product_id) desc').limit(4).pluck(:product_id))
  	@genres = Genre.where(genre_status: 0)
  end

  def search
  	@genres = Genre.where(genre_status: 0)
	  @products = Product.where(genre_id: params[:genre_id].to_i).page(params[:page]).per(8)
    @genre = Genre.find(params[:genre_id])
  end

  def abaut
    
  end

protected

  def product_params
    params.require(:product).permit(:image, :product_name, :explanation, :genre_id, :nontax, :sales_status)
  end


end
