class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
    	t.integer :followed_id, foreign_key: true
    	t.integer :follower_id, foreign_key: true
      
      t.timestamps
    end
    add_index :followers, :follower_id
    add_index :followers, :followed_id
  end
end
