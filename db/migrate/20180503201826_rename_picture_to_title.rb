class RenamePictureToTitle < ActiveRecord::Migration[5.1]
  def change
    rename_column :photos, :picture, :title
  end
end
