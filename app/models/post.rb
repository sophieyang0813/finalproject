class Post < ApplicationRecord
	belongs_to :supporter
	# belongs_to :order
	mount_uploaders :photos, PhotoUploader
	validates :pickup_start, presence: true
	validates :pickup_end, presence: true


       # scope :search_with_country, -> (country){ where("country like ?", "%#{country}%")}

       def self.search(state, town)
   
		Post.where("supporter_id IN (?)", Supporter.where("state like ?  AND  town like ?", "%#{state}%","%#{town}%" ).pluck(:id))
       	
       end

   

     


 
	
end
