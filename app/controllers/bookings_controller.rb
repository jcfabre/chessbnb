class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]

  def udpate
  end

  def new
  end

  def edit
  end

  def index
  end

  def show
  end

  def destroy
  end

  def create
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
