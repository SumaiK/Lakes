class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :holidays
  # has_many :my_holidays, class_name: "Holiday", foreign_key: "user_id", dependant: :destroy

  validates :full_name, presence: :true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :photo, PhotoUploader
end
