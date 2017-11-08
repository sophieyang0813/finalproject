class SessionsController < ApplicationController


  def new 

  end 


  def create 
    @supporter = Supporter.find(params[:email])
      if @supporter.password == params[:password]
        redirect_to foods_path
      else 
        redirect_to new_session_path
      end         
  end 




end 