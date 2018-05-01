class Holiday < ApplicationRecord
  belongs_to :user
  # belongs_to :owner, :class_name => :User, :foreign_key => "user_id"

  validates :name, presence: :true
  validates :location, presence: :true

end
