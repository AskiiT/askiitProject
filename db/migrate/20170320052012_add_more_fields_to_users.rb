class AddMoreFieldsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :first_name, :string,        null: false
    add_column :users, :last_name, :string,         null: false
    add_column :users, :username, :string,          null: false
    add_column :users, :date_created, :datetime,    null: false
    add_column :users, :description, :text
    add_index :users, :username,                unique: true
  end
end
