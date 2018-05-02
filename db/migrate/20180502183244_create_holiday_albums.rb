class CreateHolidayAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :holiday_albums do |t|
      t.string :name
      t.string :image
      t.integer :rating
      t.references :holiday, foreign_key: true

      t.timestamps
    end
  end
end
