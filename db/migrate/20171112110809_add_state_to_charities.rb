class AddStateToCharities < ActiveRecord::Migration[5.1]
  def change
    add_column :charities, :state, :string
  end
end
