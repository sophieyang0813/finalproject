class SupportersController < ApplicationController


  def new
    @supporter = Supporter.new 
  end 

  def create 
    @supporter = Supporter.new(supporter_params)

    if @supporter.save 
      redirect_to supporters_path
    else
      render template: "supporters/new" 
    end 
  end 

  def index
    @supporters = Supporter.all
  end 

  private 

  def supporter_params
    params.require(:supporter).permit(:last_name, :first_name, :email, :password, :org_name, :org_type, :town, :address, :phone_num)
  end 




end 