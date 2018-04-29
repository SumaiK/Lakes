class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :full_name, :string
    add_column :users, :photo, :string
    add_column :users, :birth_date, :date
    add_column :users, :description, :text
  end
end
