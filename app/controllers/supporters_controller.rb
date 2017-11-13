class SupportersController < ApplicationController
  before_action :set_supporter,only: [:show,:edit,:update]

  def index

    @supporter = Supporter.find(params[:supporter_id])
    
    @posts = @supporter.posts

  end 

  def new
    @supporter = Supporter.new 
    @states = state_options
  end 

  def create

    @supporter = Supporter.new(supporter_params)

    if @supporter.save
      redirect_to root_path
    else
      @states = state_options
      render "new" 
    end 
  end 

  def show
  end



  def edit
    @states = state_options
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
    params[:supporter][:state].downcase
    params.require(:supporter).permit(:last_name, :first_name, :email, :password, :org_name, :org_type, :state, :town, :address, :phone_num, photos: [])

  end 

  def state_options
    states = []
    Malaysia.states.each do |s|
      states.push([s,s])
    end
    return states.sort!
  end

end 