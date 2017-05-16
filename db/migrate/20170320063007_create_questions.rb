class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title,                        null: false
      t.text :body
      t.datetime :date_posted,                null: false, :default=> DateTime.now
      t.integer :difficulty,                  null: false, :default => 1
      t.references :user, foreign_key: true, on_destroy: :cascade
      t.references :topic, foreign_key: true

      t.timestamps
    end
  end
end
