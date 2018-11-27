class GamesController < ApplicationController
  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  def destroy
    authorize @game
    @game.destroy
    redirect_to games_path
  end

  def index
  end

  def update
  end
end
