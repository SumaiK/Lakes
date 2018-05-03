class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :picture
      t.string :location
      t.text :caption
      t.integer :rating
      t.references :holiday_album, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
