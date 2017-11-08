class CreateCharities < ActiveRecord::Migration[5.1]
  def change
    create_table :charities do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :charity_type 
      t.string :charity_name 
      t.string :address
      t.string :phone_num

      t.timestamps
    end
  end
end