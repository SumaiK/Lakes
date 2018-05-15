class HolidayAlbum < ApplicationRecord
  belongs_to :holiday
  has_many :photos

  validates :name, presence: :true

  mount_uploader :image, PhotoUploader
end
