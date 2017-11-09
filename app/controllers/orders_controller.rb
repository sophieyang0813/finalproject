class OrdersController < ApplicationController
	def new
		@order= Order.new
	end

	def create
		# @order= current_charity.orders.new
		(order_params)
		# if @order.save
		# 	redirect_to post_order_path
		# else
		# 	render 'new'
		# end
	end

	def show
		@order= Order.find(params[:id])
	end

	private

	def order_params

		params.permit(:post_id, :charity_id, :collection_date, :collection_time)

	end

end
