class NewpostMailer < ApplicationMailer

	# send to all charity

	default from: 'foodloveshareproject@gmail.com'

	 def notification_email(charity, supporter, post_id)
	    @supporter = supporter
	    @charity = charity
	    @post = Post.find(post_id)
	    #once customer reserved a listing, it will send email to the listing host.
	    mail(to: @charity, subject: "New food is posting from #{@supporter}")

	  end
end
