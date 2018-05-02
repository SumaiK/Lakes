class HolidayAlbum < ApplicationRecord
  belongs_to :holiday

  validates :name, presence: :true

  mount_uploader :image, PhotoUploader
end
