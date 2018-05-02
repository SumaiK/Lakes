class Holiday < ApplicationRecord
  belongs_to :user
  has_many :holiday_albums
  # belongs_to :owner, :class_name => :User, :foreign_key => "user_id"

  validates :name, presence: :true
  validates :location, presence: :true

  mount_uploader :photo, PhotoUploader
end
