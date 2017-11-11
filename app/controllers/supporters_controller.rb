class SupportersController < ApplicationController
  before_action :set_supporter,only: [:show,:edit,:update]

  def index
  @supporters = Supporter.all
  end 

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

  def show
  end



  def edit
     # @supporter = Supporter.find(params[:id])
  end

  def update
    # @supporter = current_user 
    if @supporter.update(supporter_params)
      redirect_to @supporter
    else
      p @supporter.errors
      render :edit
    end

  end 
 

  private 

  def set_supporter
    @supporter = Supporter.find(params[:id])

  end

  def supporter_params
    params.require(:supporter).permit(:last_name, :first_name, :email, :password, :org_name, :org_type, :town, :address, :phone_num)
  end 




end 