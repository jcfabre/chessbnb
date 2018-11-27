class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def new
    @game = Game.new
  end

  def create
    @user = current_user
    @game = Game.new(game_params)
    @game.user = @user
    @game.time_control = TimeControl.find(game_params[:time_control_id])
    if @game.save!
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
  end

  def index
    @games = Game.all
  end

  def update
    if @game.update(game_params)
      redirect_to @game
    else
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :address, :description, :time_flexible, :start_date, :end_date, :time_control_id)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
