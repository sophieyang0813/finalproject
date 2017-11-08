class AddPasswordToSupporters < ActiveRecord::Migration[5.1]
  def change
    add_column :supporters, :password_digest, :string 

  end
end
