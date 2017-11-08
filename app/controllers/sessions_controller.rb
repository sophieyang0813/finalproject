class SessionsController < ApplicationController


  def new 

  end 


  def create 
    @supporter = Supporter.find_by(email: params[:session][:email])
      if @supporter && @supporter.authenticate(params[:session][:password])
        redirect_to supporters_path
      else 
        redirect_to new_session_path
      end         
  end 




end 