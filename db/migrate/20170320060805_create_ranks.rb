class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.integer :clarity
      t.integer :quickness
      t.integer :efectiveness
      t.references :user, uniqueness: true, foreign_key: true

      t.timestamps
    end
  end
end
