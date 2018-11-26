class Game < ApplicationRecord
  belongs_to :user
  belongs_to :time_control
end
