class CharitiesController < ApplicationController

 before_action :set_charity, only: [:show,:edit,:update,:orders]


 def new
  @charity = Charity.new
  @states = state_options
end

  def create 
    @charity = Charity.new(charity_params)

def create 
  @charity = Charity.new(charity_params)

  end 

  private 
  
  def charity_params
    params.require(:charity).permit(:last_name, :first_name, :email, :charity_type, :charity_name, :address, :phone_num, :town, :password)
  end 

def show
end

def edit
  @states = state_options
end


def update
  if @charity.update(charity_params)
    redirect_to @charity
  else
    p @charity.errors
    render :edit
  end
end

def orders
  @orders= @charity.orders
end


private 

def charity_params
  params.require(:charity).permit(:last_name, :first_name, :email, :charity_type, :charity_name, :address, :phone_num, :town, :password, photos: [])
end 

def set_charity
  @charity = Charity.find(params[:id])
end

def state_options
  states = []
  Malaysia.states.each do |s|
    states.push([s,s])
  end
  states.sort!
end

end 