class Customer::OrdersController < ApplicationController
    def index #注文履歴一覧画面(途中)
    end

    def show #注文履歴画面(途中)
    end

    def create #注文の追加を保存
        @order.save
        redirect_to customer_orders_confirm_path
    end

    def input #注文情報入力画面(途中)
        @customer = current_customer
        
    end

    def confirm #注文情報確認画面(途中)
        # @order = Order.new
        # @order = session[:order_id]
        @cart = CartItem.where(customer_id: current_customer.id)
        
        trigger = params[:trigger] #[自身=>A、登録済=>B、新規登録=>C]
        if trigger == 'C' #新しいお届け先
            @order = Order.new
            @order.payment_method = params[:payment_method]
            @order.customer_id = current_customer.id
            @order.ordered_postal_code = params[:ordered_postal_code]
            @order.ordered_address = params[:ordered_address]
            @order.address_name = params[:address_name] 
        elsif trigger == 'A' #ご自身の住所
            @order = Order.new
            @order.payment_method = params[:payment_method]
            @order.customer_id = current_customer.id
            @order.ordered_postal_code = current_customer.postal_code
            @order.ordered_address = current_customer.address
            @order.address_name = current_customer.first_name
        elsif trigger == 'B' #新しい配送先
            @order = Order.new
            @order.customer_id = current_customer.id
            @order.payment_method = params[:payment_method]
            @order.ordered_postal_code = Shipping.find(params[:address_id]).postal_code
            @order.ordered_address = Shipping.find(params[:address_id]).address
            @order.address_name = Shipping.find(params[:address_id]).name
        end
    end

    def done #注文完了画面(OK)
    end
end
