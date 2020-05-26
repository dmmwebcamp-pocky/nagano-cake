class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!, only: [:show, :edit]

  def show
    @customer = current_customer
  end

  def edit
  	@customer = current_customer
  end

  def update
  	@customer = current_customer
    if @customer.update(customer_params)
      redirect_to customer_customers_path
    else
      render :edit
    end
  end

  def withdraw #退会ページ用
  end

  def destroy
  	customer = current_customer
    customer.update(customer_status: "退会済")
    redirect_to root_path
  end

  	private
	 def customer_params
	   params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :phone_number, :email, :customer_status, :deleted_at)
	 end

end
