class Game < ApplicationRecord
  belongs_to :user
  belongs_to :time_control

  mount_uploader :photo, PhotoUploader
end
