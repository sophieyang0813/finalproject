class Post < ApplicationRecord
	belongs_to :supporter
	belongs_to :order
	mount_uploaders :photos, PhotoUploader
	
end
