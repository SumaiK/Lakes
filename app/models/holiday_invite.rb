class HolidayInvite < ApplicationRecord
  belongs_to :user
  belongs_to :holiday

  validates :status, inclusion: { in: ["pending", "declined", "accepted"] }

  scope :accepted_users, -> { where(status: 'accepted') }
  scope :pending_users, -> { where(status: 'pending') }
  scope :rejected_users, -> { where(status: 'declined') }
end
