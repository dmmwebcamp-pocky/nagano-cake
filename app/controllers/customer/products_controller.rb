class Customer::ProductsController < ApplicationController
    #商品一覧ページ
    def index
        #product.allにページネーション実装(1ページ8件)
        @products = Product.where(sales_status: 0).page(params[:page]).per(8)
        #, Product.genres.genre_status: 0
        @genres = Genre.where(genre_status: 0)
    end
    
    #商品詳細ページ
    def show
        @genres = Genre.where(genre_status: 0)
        @product = Product.find(params[:id])
        @quantity = CartItem.new
        @product_comment = Comment.new
        @product_comments = @product.comments
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
