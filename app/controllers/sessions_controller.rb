class SessionsController < ApplicationController


  def new 

  end 


  def create 

    @user = Supporter.find_by(email: params[:session][:email]) || Charity.find_by(email: params[:session][:email]) 

    if @user && @user.authenticate(params[:session][:password])
        if @user.class == Supporter
          session[:user_id] = @user.id  #
          redirect_to posts_path
        elsif @user.class == Charity
          session[:user_id] = @user.id
           redirect_to posts_path
        end
    else
      flash[:warning] = "Invalid Username or password"
      # @errors = "Invalid Username or password"
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



  def destroy
    session[:user_id] = nil
    # flash[:notice] = "You have successfully logged out."


    redirect_to root_path, :flash => { :success => "logged out successfully!"}


  end



end 