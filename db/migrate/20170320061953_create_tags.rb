class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :tag_name, 			:null => false
      t.references :topic, foreign_key: true
      t.timestamps
    end

    add_index :tags, :tag_name, unique: true
  end
end
