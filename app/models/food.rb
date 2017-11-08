class Food < ApplicationRecord

	# belongs_to :charity
	# belongs_to :delivery
	mount_uploaders :photos, PhotoUploader
end
