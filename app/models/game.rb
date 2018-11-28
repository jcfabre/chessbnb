class Game < ApplicationRecord
  belongs_to :user
  belongs_to :time_control

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
