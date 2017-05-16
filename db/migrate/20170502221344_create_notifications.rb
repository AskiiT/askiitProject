class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :body
      t.integer :read, :default => 0
      t.timestamps
    end
  end
end
