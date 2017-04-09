class AddShirtToAvatar < ActiveRecord::Migration[5.0]
  def change
    add_column :avatars, :shirt, :string
  end
end
