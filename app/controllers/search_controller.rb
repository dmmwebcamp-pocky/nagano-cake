class SearchController < ApplicationController
  def search
  	@customers = Customer.where('first_name like? or last_name like? or first_name_kana like? or last_name_kana like?', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%").page(params[:page]).per(5)
  	
  end
end
