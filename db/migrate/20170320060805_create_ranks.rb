class CreateRanks < ActiveRecord::Migration[5.0]
  def change
    create_table :ranks do |t|
      t.integer :clarity, :null=> false, :default => 0
      t.integer :quickness, :null=> false, :default => 0
      t.integer :efectiveness, :null=> false, :default => 0
      t.references :user, uniqueness: true, foreign_key: true, on_destroy: :cascade

      t.timestamps
    end
  end
end
