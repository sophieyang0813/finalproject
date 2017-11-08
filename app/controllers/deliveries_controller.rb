class DeliveriesController < ApplicationController

	def new
		@delivery= Delivery.new
	end

	def create
		@delivery= current_charity.deliveries.new(delivery_params)
		if @delivery.save
			redirect_to @delivery
		else
			render 'new'
		end
	end

	def show
		@delivery= current_delivery.foods
	end

	def index
		render 'delivery/index'
	end
	def add


	end

	private
	def delivery_params
		params.require(:delivery).permit(:charity_id, :pickup_date, :pickup_location)
	end


end
