
class OrdersController < ApplicationController
	def new
		@order= Order.new
		@post= Post.find(params[:post_id])
	end

	def create
		
		@post= Post.find(params[:post_id])
		@order= current_user.orders.new(order_params)

        @order.charity_id = current_user.id
		@order.post_id= params[:post_id]


		if @order.save

			NewOrderMailer.order_email_to_charity(@order.post.supporter.id, @order.post_id, @order.id).deliver_later
		
			NewOrderMailer.order_email_to_supporter(@order.charity_id, @order.id, @order.post.supporter.id).deliver_later

			redirect_to post_order_path(@order.post_id, @order.id)
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


		params.require(:order).permit(:collection_date, :collection_time)


	end

end

