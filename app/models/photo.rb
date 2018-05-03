class Photo < ApplicationRecord
  belongs_to :holiday_album
  belongs_to :user

  validates :title, presence: :true

  # mount_uploader :photo, PhotoUploader
end
