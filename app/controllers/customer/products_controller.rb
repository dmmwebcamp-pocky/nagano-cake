class Customer::ProductsController < ApplicationController
    #商品一覧ページ
    def index
        #product.allにページネーション実装(1ページ8件)
        @products = Product.all.page(params[:page]).per(8)
    end
    
    #商品詳細ページ
    def show
        @product = Product.find(params[:id])
        @quantity = CartItem.new
    end
    
    #（仮）カートへ追加する数量を送信
    def create
        @quantity = Product.new(product_params)
    end

    private

    def product_params
        params.require(:product).permit(:image, :product_name, :explanation, :genre_id, :nontax, :sales_status)
    end
end
