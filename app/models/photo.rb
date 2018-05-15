class Photo < ApplicationRecord
  belongs_to :holiday_album
  belongs_to :user
  # belongs_to :holidays, through: :holiday_album

  validates :title, presence: :true

  mount_uploader :photo, PhotoUploader
end
