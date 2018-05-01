class CreateHolidayInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :holiday_invites do |t|
      t.string :status
      t.references :user, foreign_key: true
      t.references :holiday, foreign_key: true

      t.timestamps
    end
  end
end
