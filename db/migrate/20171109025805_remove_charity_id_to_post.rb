class RemoveCharityIdToPost < ActiveRecord::Migration[5.1]
  def change
  	remove_column :posts, :charity_id
  end
end
