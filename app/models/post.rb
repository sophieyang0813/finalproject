class Post < ApplicationRecord
	belongs_to :supporter
	mount_uploaders :photos, PhotoUploader
end
