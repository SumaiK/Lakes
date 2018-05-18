class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :holidays
  has_many :holidays, through: :holiday_invites
  has_many :holiday_invites
  has_many :photos
  has_many :holiday_albums, through: :photos
  has_many :my_holidays, foreign_key: "user_id", class_name: "Holiday"

  validates :full_name, presence: :true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :photo, PhotoUploader
end
