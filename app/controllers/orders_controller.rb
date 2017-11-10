
class OrdersController < ApplicationController
	def new
		@order= Order.new
		@post= Post.find(params[:post_id])
	end

	def create
		@order= current_user.orders.new(order_params)
    @order.charity_id = current_user.id

		if @order.save
			redirect_to @order
		else
			render 'new'
		end
	end

	def show
		@order= Order.find(params[:id])
	end

	private

	def order_params

		params.require(:order).permit(:post_id, :collection_date, :collection_time)

	end

end

