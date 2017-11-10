class SupportersController < ApplicationController


  def new
    @supporter = Supporter.new 
  end 

  def create 
    # byebug
    
    @supporter = Supporter.new(supporter_params)

    if @supporter.save
      session[:user_id] = @supporter.id
      redirect_to posts_path
    else
      render template: "supporters/new" 
    end 
  end 

  def index
    @supporters = Supporter.all
  end 

  def edit
     @supporter = Supporter.find(params[:id])
  end

  def update
    @supporter = current_user 
    @supporter.update(supporter_params)
  end 
 

  private 

  def supporter_params
    params.require(:supporter).permit(:last_name, :first_name, :email, :password, :org_name, :org_type, :town, :address, :phone_num)
  end 




end 