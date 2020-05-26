class Customer::OrdersController < ApplicationController
    before_action :authenticate_customer!

    def index #注文履歴一覧画面(途中)
        @order = Order.where(customer_id: current_customer.id)
    end

    def show #注文履歴画面(途中)
        @order = Order.find(params[:id])
    end

    def create #注文の追加を保存
        @order = Order.new(collect_order)
        @order.save
        #カートアイテム全削除
       @carts = CartItem.where(customer_id: current_customer.id) 
        @carts.each do |carts|
            @ordered = OrderedProduct.new
            @ordered.order_id = @order.id
            @ordered.product_id = carts.product_id
            @ordered.quantity = carts.quantity
            @ordered.product_tax = carts.product.nontax * 1.1
            @ordered.save
        end
        @carts.destroy_all
        redirect_to customer_orders_done_path
    end

    def input #注文情報入力画面(途中)
        @customer = current_customer
        
    end

    def confirm #注文情報確認画面(途中)
        @shippings = Shipping.all
        @cart = CartItem.where(customer_id: current_customer.id)
        
        trigger = params[:trigger] #[自身=>A、登録済=>B、新規登録=>C]
        if trigger == 'C' #新しいお届け先
            @order = Order.new
            @shipping = Shipping.new
            @order.payment_method = params[:payment_method]
            @order.customer_id = current_customer.id
            @order.ordered_postal_code = params[:ordered_postal_code]
            @order.ordered_address = params[:ordered_address]
            @order.address_name = params[:address_name]
            @shipping.customer_id = current_customer.id
            @shipping.postal_code = params[:ordered_postal_code]
            @shipping.address = params[:ordered_address] 
            @shipping.name = params[:address_name]
            @shipping.save
            if ((@order.ordered_postal_code == "") || (@order.ordered_address == "") || (@order.address_name == ""))
                redirect_to customer_orders_input_path
            end
        elsif trigger == 'A' #ご自身の住所
            @order = Order.new
            @order.payment_method = params[:payment_method]
            @order.customer_id = current_customer.id
            @order.ordered_postal_code = current_customer.postal_code
            @order.ordered_address = current_customer.address
            @order.address_name = (current_customer.first_name + current_customer.last_name)
        elsif trigger == 'B' #登録済の住所
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

    private
      def collect_order
        params.require(:order).permit(:ordered_postal_code, :ordered_address, :address_name, :shipping_cost, :total_price, :payment_method, :order_status, :customer_id)
      end
end
