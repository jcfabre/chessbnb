class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, presence: true, allow_blank: false
  validates :rating, inclusion: { in: 1000..3000, message: 'The rating must be between 1000 and 3000' }

  has_many :games
  has_many :bookings

  mount_uploader :photo, PhotoUploader

  def full_name
    "#{first_name} #{last_name}"
  end
end
