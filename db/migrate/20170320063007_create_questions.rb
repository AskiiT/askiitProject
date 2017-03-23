class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title,                        null: false
      t.text :body
      t.datetime :date_posted                 null: false
      t.integer :difficulty                   null: false
      t.references :user, foreign_key: true
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
