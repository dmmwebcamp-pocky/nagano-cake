class Customer::OrdersController < ApplicationController
    def index #注文履歴一覧画面(途中)
    end

    def show #注文履歴画面(途中)
    end

    def create #注文の追加を保存
        #@order.customer_id = current_customer.id
        trigger = params[:trigger] #[自身=>A、登録済=>B、新規登録=>C]
        if trigger == 'C' #新しいお届け先
            @order = Order.new
            @order.payment_method = params[:payment_method]
            @order.customer_id = Customer.find(1).id
            #@order.customer_id = current_customer.id
            @order.ordered_postal_code = params[:ordered_postal_code]
            @order.ordered_address = params[:ordered_address]
            @order.address_name = params[:address_name]
            @order.save
            redirect_to customer_orders_confirm_path
        elsif trigger == 'A' #ご自身の住所
            @order = Order.new
            @order.payment_method = params[:payment_method]
            @order.customer_id = Customer.find(1).id
            #@order.customer_id = current_customer.id
            @order.ordered_postal_code = Customer.find(1).postal_code
            @order.ordered_address = Customer.find(1).address
            @order.address_name = Customer.find(1).first_name
            @order.save
            redirect_to customer_orders_confirm_path
        else
            @order = Order.new
            @order.customer_id = Customer.find(1).id
            @order.payment_method = params[:payment_method]
            #@order.customer_id = current_customer.id
            @order.ordered_postal_code = Shipping.find(params[:address_id]).postal_code
            @order.ordered_address = Shipping.find(params[:address_id]).address
            @order.address_name = Shipping.find(params[:address_id]).name
            @order.save
            redirect_to customer_orders_confirm_path
        end
    end

    def input #注文情報入力画面(途中)
        @customer = Customer.find(1)
        @order = Order.new
    end

    def confirm #注文情報確認画面(途中)
        @orders = Order.all
        @order = Order.find(1)
    end

    def done #注文完了画面(OK)
        @order = Order.find(1)
    end
end
