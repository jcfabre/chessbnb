class TimeControl < ApplicationRecord
  def create
    @time_control = Time_control.new
  end

end
