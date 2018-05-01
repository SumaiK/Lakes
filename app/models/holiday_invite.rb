class HolidayInvite < ApplicationRecord
  belongs_to :user
  belongs_to :holiday
end
