class AddAvailableTimeToPosts < ActiveRecord::Migration[5.1]

  def change
    add_column :posts, :pickup_start, :datetime
    add_column :posts, :pickup_end, :datetime
  end

end
