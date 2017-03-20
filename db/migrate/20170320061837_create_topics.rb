class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :topic_name
      t.text :topic_description

      t.timestamps
    end
  end
end
