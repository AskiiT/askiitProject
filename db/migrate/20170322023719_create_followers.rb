class CreateFollowers < ActiveRecord::Migration[5.0]
  def change
    create_table :followers do |t|
      t.references :followed, foreign_key: true
      t.references :follower, foreign_key: true

      t.timestamps
    end
  end
end
