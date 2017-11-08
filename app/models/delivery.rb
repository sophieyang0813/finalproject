class Delivery < ApplicationRecord

	has_many :foods
	belongs_to :charity

end
