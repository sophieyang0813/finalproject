class ContentsController < ApplicationController



  def index
  end 

  def show 
    @user = Supporter.find_by(email: params[:session][:email]) || Charity.find_by(email: params[:session][:email]) 
  end 

end 