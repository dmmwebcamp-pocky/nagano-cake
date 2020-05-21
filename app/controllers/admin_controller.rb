class AdminController < ApplicationController
  def top
  	@orders = Order.all
  end
end
