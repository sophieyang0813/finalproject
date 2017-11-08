class ApplicationController < ActionController::Base
	def current_delivery
		if session[:delivery_id]
			@delivery= Delivery.find(session[:delivery_id])
		else
			@delivery = Delivery.create
			session[:delivery_id] = @delivery.id
		end
	end
end