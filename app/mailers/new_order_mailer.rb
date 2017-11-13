class NewOrderMailer < ApplicationMailer
	default from: 'foodloveshareproject@gmail.com'

	def order_email_to_charity(supporter_id, post_id, order_id)
		@supporter= Supporter.find(supporter_id)
		@order = Order.find(order_id) 
		@post = Post.find(post_id)
	    #once charity reserved a post, it will send email to the post charity.
	    mail(to: 'foodloveshareproject@gmail.com', subject: "We will reserved your food!" )
	    # mail(to: @order.charity.email, subject: "We will reserved your food!" )

	  end

	  def order_email_to_supporter(charity_id, order_id, supporter_id)
	  	@supporter= Supporter.find(supporter_id)
	  	@charity = Charity.find(charity_id)
	  	@order = Order.find(order_id)
	    #once charity reserved a post, it will send email to the post supporter.
	    mail(to: 'foodloveshareproject@gmail.com', subject: "Someone is interested in your post!")
        # mail(to: @order.post.supporter.email, subject: "Someone is interested in your post!")

	  end
	end
