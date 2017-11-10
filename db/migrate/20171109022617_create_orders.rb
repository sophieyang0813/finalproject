class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
    	t.integer :post_id
    	t.integer :charity_id
    	t.date :collection_date
    	t.string :collection_time
      t.timestamps
    end
  end
end
