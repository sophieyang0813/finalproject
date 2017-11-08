class CreateDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :deliveries do |t|
      t.belongs_to :charity, index: true
      t.datetime :pickup_date
      t.string :pickup_location
      t.timestamps
    end
  end
end
