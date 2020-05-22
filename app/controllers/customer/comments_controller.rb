class Customer::CommentsController < ApplicationController
	def create
		product = Product.find(params[:product_id])
		comment = current_customer.comments.new(comment_params)
		comment.product_id = product.id
		if comment.save
		    redirect_to customer_product_path(product.id)
		else
			@genres = Genre.all
			@product = Product.find(params[:product_id])
        	@quantity = CartItem.new
        	@product_comment = Comment.new
        	@product_comments = @product.comments
			render 'customer/products/show'
		end
	end

	def destroy
		
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
