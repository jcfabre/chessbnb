class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, :only => :index
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def show
    @user = @game.user
    @booking = Booking.new
    authorize @game
    @markers = {
        lng: @game.longitude,
        lat: @game.latitude,
        infoWindow: render_to_string(partial: "../views/shared/infowindow", locals: { game: @game })
      }
  end

  def edit
    @user = current_user
    authorize @game
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create
    @user = current_user
    @game = Game.new(game_params)
    authorize @game
    @game.user = @user
    @game.time_control = TimeControl.find(game_params[:time_control_id])
    if @game.save!
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
    authorize @game
    @game.destroy
    redirect_to games_path
  end

  MATCH_HASH = {"Pawn" => 1000, "Knight" => 1500, "Bishop" => 1800, "Rook" => 2000, "Queen" => 2300, "King" => 2500}

  def index
    if params[:address].present? || params[:time_control].present? || params[:rating].present?
      sql_query = "games.address ILIKE :address \
                  AND time_controls.name ILIKE :time_control \
                  AND users.rating >= :rating"

      @games = Game.joins(:user).joins(:time_control).where(sql_query,
                                        address: "%#{params[:address]}%",
                                        time_control: "%#{params[:time_control]}%",
                                        rating: MATCH_HASH[params[:rating]] || 0)
    else
      @games = policy_scope(Game).where.not(latitude: nil, longitude: nil)
    end
    @markers = @games.map do |game|
      {
        lng: game.longitude,
        lat: game.latitude,
        infoWindow: render_to_string(partial: "../views/shared/infowindow", locals: { game: game })
      }
    end
  end

  def update
    authorize @game
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  def list
    @games = current_user.games
    authorize @games
  end

  private

  def game_params
    params.require(:game).permit(:title, :address, :photo, :description, :time_flexible, :start_date, :end_date, :time_control_id)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
