class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_game, only: [:new, :create]

  def udpate
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def index
    @bookings = Booking.all
  end

  def show
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.game = @game
    if @booking.save
      redirect_to bookings_path
    else
      render "new"
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end
end
