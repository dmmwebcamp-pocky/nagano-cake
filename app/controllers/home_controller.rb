class HomeController < ApplicationController
  def top
  	@products = Product.all
  end

  def search
  end

end
