class AddPhotosToFoods < ActiveRecord::Migration[5.1]
  def change
    add_column :foods, :photos, :json
  end
end
