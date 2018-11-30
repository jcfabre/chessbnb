class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :index]

  def show
    # @user = current_user

    authorize @user
  end

  def index
    @users = policy_scope(User)
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    authorize @user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :photo)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
