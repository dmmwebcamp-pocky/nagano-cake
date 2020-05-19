class Customer::CartItemsController < ApplicationController

  def index
    @carts = current_customer.cart_items

  end

  def create
    @cart = CartItem.find_by(customer_id: current_customer.id, product_id: params[:cart_item][:product_id] )
    if @cart
      @cart.quantity += params[:cart_item][:quantity].to_i
    else
      @cart = CartItem.new(cart_item_params)
      @cart.customer_id = current_customer.id
    end
    @cart.save
    redirect_to customer_cart_items_path
  end

  def update
    @cart = CartItem.find(params[:id])
    @cart.customer_id= current_customer.id
    @cart.update(cart_item_params)
    redirect_to customer_cart_items_path
  end

  def cancel
    @cart = CartItem.find(params[:id])
    @cart.destroy
    redirect_to customer_cart_items_path
  end

  def destroy
    @carts = current_customer.cart_items
    @carts.destroy_all
    redirect_to customer_products_path
  end


private
  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end

end
