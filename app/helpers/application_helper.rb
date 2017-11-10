module ApplicationHelper
	
  def current_user 

    @current_user ||= session[:user_id] &&
      (Supporter.find_by(id: session[:user_id]) || Charity.find_by(id: session[:user_id]))
  end 

end
