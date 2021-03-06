class Charity < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  has_many :orders
  mount_uploaders :photos, PhotoUploader
  geocoded_by :address
  after_validation :geocode
end
