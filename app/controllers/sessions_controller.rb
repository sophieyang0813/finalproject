class SessionsController < ApplicationController


  def new 

  end 


  def create 
    @user = Supporter.find_by(email: params[:session][:email]) || Charity.find_by(email: params[:session][:email]) 

    if @user && @user.authenticate(params[:session][:password])
        if @user.class == Supporter
          redirect_to foods_path
        elsif @user.class == Charity
           redirect_to foods_path
        end
      else
        redirect_to new_session_path
      end         




      # if @supporter && @supporter.authenticate(params[:session][:password])
      #   redirect_to supporters_path
      # elsif 
      #   redirect_to new_session_path
      # elsif 
      #   @charity && @charity.authenticate(params[:session][:password])
      #   redirect_to charities_path
      # elsif 
      #   redirect_to new_session_path 
      # end         

      # if @charity && @charity.authenticate(params[:session][:password])
      #   redirect_to charities_path
      # else
      #   redirect_to new_session_path 
      # end 


  end 




end 