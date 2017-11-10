class OrdersController < ApplicationController
	def new
		@order= Order.new
		@post= Post.find(params[:post_id])
	end

	def create
		
		@post= Post.find(params[:post_id])
		@order= current_user.orders.new(order_params)
		@order.post_id = @post.id
		if @order.save
			redirect_to posts_url

		   @post.update(ordered_post: true)
		else
			render 'new'
		end
	end

	def show
		@order= Order.find(params[:id])
	end

	private

	def order_params

		params.require(:order).permit(:post_id, :charity_id, :collection_date, :collection_time)

	end

end
