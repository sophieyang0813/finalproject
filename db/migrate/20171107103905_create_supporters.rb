class CreateSupporters < ActiveRecord::Migration[5.1]
  def change
    create_table :supporters do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :org_name
      t.string :org_type
      t.string :address
      t.string :phone_num

      t.timestamps
    end
  end
end
