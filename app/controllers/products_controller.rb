class ProductsController < ApplicationController
    #商品一覧ページ
    def index
        @products = Product.all
    end
    
    #商品詳細ページ
    def show
        @product = Product.find(params[:id])
    end
end
