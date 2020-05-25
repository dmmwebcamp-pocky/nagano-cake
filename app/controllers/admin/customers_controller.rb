class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.with_deleted.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.with_deleted.find(params[:id])
  end

  def edit
    @customer = Customer.with_deleted.find(params[:id])
  end

  def update
    @customer = Customer.with_deleted.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end

  def destroy
    @customer = Customer.with_deleted.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :email, :postal_code, :address, :phone_number, :customer_status, :deleted_at)
  end
end
