class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true, allow_blank: false

  has_many :games
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
