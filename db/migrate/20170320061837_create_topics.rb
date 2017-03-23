class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :topic_name, 		:null => false
      t.text :topic_description
      t.timestamps
    end

    add_index :topics, :topic_name, unique: true
  end
end
