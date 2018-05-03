class Photo < ApplicationRecord
  belongs_to :holiday_album
  belongs_to :user
end
