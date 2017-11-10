class ApplicationController < ActionController::Base

	def current_delivery
		if session[:delivery_id]
			@delivery= Delivery.find(session[:delivery_id])
		else
			@delivery = Delivery.create
			session[:delivery_id] = @delivery.id
		end
	end



  private 
  
  def current_user 
    @current_user ||= session[:user_id] &&
      (Supporter.find_by(id: session[:user_id]) || Charity.find_by(id: session[:user_id]))
  end 

  helper_method :current_user

end