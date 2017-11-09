class CharitiesController < ApplicationController


  def new
   @charity = Charity.new 
  end 

  def create 
    @charity = Charity.new(charity_params)

    if @charity.save 
      session[:user_id] = @charity.id
      redirect_to posts_path
    else 
      render template: "charities/new"
    end 

  end 

  private 
  
  def charity_params
    params.require(:charity).permit(:last_name, :first_name, :email, :charity_type, :charity_name, :address, :phone_num, :town, :password)
  end 

end 