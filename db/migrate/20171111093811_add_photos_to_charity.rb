class AddPhotosToCharity < ActiveRecord::Migration[5.1]
  def change
    add_column :charities, :photos, :json
  end
end
