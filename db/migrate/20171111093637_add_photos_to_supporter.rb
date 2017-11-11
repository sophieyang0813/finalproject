class AddPhotosToSupporter < ActiveRecord::Migration[5.1]
  def change
    add_column :supporters, :photos, :json
  end
end
