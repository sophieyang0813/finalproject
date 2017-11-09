class AddPhotosToPost < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :photos, :json
  end
end
