class AddLongitudeToCharities < ActiveRecord::Migration[5.1]

	def change
		add_column :charities, :longitude, :float
		add_column :charities, :latitude, :float

	end
end
