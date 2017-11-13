module ApplicationHelper
	
  def current_user 

    @current_user ||= session[:user_id] &&
      (Supporter.find_by(id: session[:user_id]) || Charity.find_by(id: session[:user_id]))
  end 


  def flash_class(level)
    case level
        when "info" then "alert alert-info"
        when "success" then "alert alert-success"
        when "warning" then "alert alert-warning"
        when "danger" then "alert alert-danger"
    end
end



end
