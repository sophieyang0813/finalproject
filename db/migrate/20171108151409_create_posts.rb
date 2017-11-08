class CreatePosts < ActiveRecord::Migration[5.1]
	def change
		create_table :posts do |t|
			t.string :description
			t.datetime :deadline_for_collection
			t.integer :supporter_id
			t.integer :charity_id  
			t.timestamps
		end
	end
end
