class AddLevelPictureToPictures < ActiveRecord::Migration[5.0]
  def change
    add_column :pictures, :level_picture, :string
  end
end
