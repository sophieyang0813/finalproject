class Supporter < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  mount_uploaders :photos, PhotoUploader



  

end



