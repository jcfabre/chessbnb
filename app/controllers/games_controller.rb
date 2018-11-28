class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  def show
    @user = @game.user
    authorize @game
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

  def index
    @games = policy_scope(Game)
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
    @games = Game.where(user: current_user)
  end

  private

  def game_params
    params.require(:game).permit(:title, :address, :photo, :description, :time_flexible, :start_date, :end_date, :time_control_id)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
