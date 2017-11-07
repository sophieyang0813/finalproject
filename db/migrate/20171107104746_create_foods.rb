class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.belongs_to :delivery, index:true 
      t.belongs_to :supporter, index:true 
      t.string :name
      t.string :quantity
      t.string :description
      t.string :type
      t.date :mfg_date 
      t.date :expiry_date

      t.timestamps
    end
  end
end
