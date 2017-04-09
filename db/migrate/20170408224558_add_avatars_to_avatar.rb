class AddAvatarsToAvatar < ActiveRecord::Migration[5.0]
  def change
    add_column :avatars, :avatars, :string
  end
end
