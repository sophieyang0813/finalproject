module ApplicationHelper
	
  def current_user 

    @current_user ||= session[:user_id] &&
      (Supporter.find_by(id: session[:user_id]) || Charity.find_by(id: session[:user_id]))
  end 


#   def flash_class(level)
#     case level
#         when :notice then "alert alert-info"
#         when :success then "alert alert-success"
#         when :error then "alert alert-error"
#         when :alert then "alert alert-error"
#     end
# end
    #sort
	def sortable(column, title = nil)
	    title ||= column.titleize
	    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
	    link_to title, :sort => column, :direction => direction
	end



end
