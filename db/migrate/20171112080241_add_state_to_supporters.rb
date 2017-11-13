class AddStateToSupporters < ActiveRecord::Migration[5.1]
  def change
    add_column :supporters, :state, :string
  end
end
