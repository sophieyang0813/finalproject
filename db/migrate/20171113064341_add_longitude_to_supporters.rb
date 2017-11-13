class AddLongitudeToSupporters < ActiveRecord::Migration[5.1]
  def change
    add_column :supporters, :longitude, :float
    add_column :supporters, :latitude, :float
  end
end
