class CreateHolidays < ActiveRecord::Migration[5.1]
  def change
    create_table :holidays do |t|
      t.string :name
      t.text :details
      t.string :location
      t.date :start_date
      t.date :end_date
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
