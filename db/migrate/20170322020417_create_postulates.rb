class CreatePostulates < ActiveRecord::Migration[5.0]
  def change
    create_table :postulates do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
