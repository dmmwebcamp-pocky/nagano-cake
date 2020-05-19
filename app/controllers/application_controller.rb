class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?


	def after_sign_up_path_for(resource)
    	if customer_signed_in?
      	  root_path
      	elsif admin_signed_in?
      	  '/admin/top'
      	end
	end

	def after_sign_in_path_for(resource)
    	if customer_signed_in?
      	  root_path
      	elsif admin_signed_in?
      	  '/admin/top'
      	end
	end

	def after_sign_out_path_for(resource)
		root_path
	end


protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:first_name_kana,:last_name_kana, :email, :postal_code, :address, :postal_code, :phone_number, :customer_status])
    end


end
