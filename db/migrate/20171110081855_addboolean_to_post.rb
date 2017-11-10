class AddbooleanToPost < ActiveRecord::Migration[5.1]
  def change
  	add_column :posts, :ordered_post, :boolean, default: false, null: false
  end
end
