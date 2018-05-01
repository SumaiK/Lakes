class HolidayInvite < ApplicationRecord
  belongs_to :user
  belongs_to :holiday

  validates :status, inclusion: { in: ["pending", "rejected", "accepted"] }
end
