class Customer::OrdersController < ApplicationController
    def index #注文履歴一覧画面(途中)
    end

    def show #注文履歴画面(途中)
    end

    def create #注文の追加を保存
        @order = Order.new(order_params)
        if @order.save
            redirect_to customer_orders_done_path
        else
            render :input
        end  
    end

    def input #注文情報入力画面(途中)
        @order = Order.new
    end

    def confirm #注文情報確認画面(途中)
    end

    def done #注文完了画面(OK)
    end

    private
        def order_params
            params.require(:order).permit(:payment_method, :ordered_address)
        end
end
