class CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer.id)
  end

  def withdraw #退会ページ用
  end

  def destroy
  	customer = Customer.find(params[:id])
    customer.destroy
    customer.customer_status = '退会済み'
    customer.save
    redirect_to new_customer_session_path
  end

  	private
	def customer_params
	  params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :customer_status, :deleted_at)

	end
end
