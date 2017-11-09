class OrdersController < ApplicationController 



  def new 
    @order = Order.new
  end 


  def create 
    @order = Order.new(order_params)
     byebug 
    @order.post_id = params[:post_id]
    @order.charity_id = current_user.id
 
    if @order.save
      redirect_to root_path
  end 


end 


private 

  def order_params
    params.require(:order).permit(:collection_time)
  end 


end