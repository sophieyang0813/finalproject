class AddPasswordToCharities < ActiveRecord::Migration[5.1]
  def change
    add_column :charities, :password_digest, :string
  end
end
