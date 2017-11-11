class Post < ApplicationRecord
	belongs_to :supporter
	# belongs_to :order
	mount_uploaders :photos, PhotoUploader
	validates :pickup_start, presence: true
	validates :pickup_end, presence: true


 
	
end
