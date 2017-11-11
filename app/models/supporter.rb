class Supporter < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :email, uniqueness: { scope: :email, 
    message: "this email is already taken" } , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

 # uniqueness: true
# uniqueness: { scope: :email, 
#     message: "this email is already taken" }

  # def initialize 
  #   @errors = ActiveModel::Errors.new(self)
  # end 

  # attr_accessor :email
  # attr_reader   :errors

  # def validate!
  #   errors.add(:email, message: "this email is already taken.") 
  # end

end



