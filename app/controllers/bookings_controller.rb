class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]
  before_action :set_game, only: [:new, :create]

  def udpate
    authorize @booking
  end

  def edit
    authorize @booking
  end

  def index
    @bookings = policy_scope(Booking).where(user: current_user)
  end

  def show
    authorize @booking
    @game_owner = @booking.game.user
    @challenger = @booking.user
  end

  def destroy
    @booking.destroy
    authorize @booking
    redirect_to bookings_path
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.game = @game
    authorize @booking
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
