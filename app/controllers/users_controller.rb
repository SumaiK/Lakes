class UsersController < ApplicationController
  before_acion :set_user, only: [:show, :edit, :update]
  before_acion :authenticate_user!

  def index
    @user = User.all
  end

  def show
    # @user = User.find(params[:id]) not needed cause of set_user method below
    set_user
    authorize @user
  end

  def edit
    set_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    authorize @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :description, :birth_date, :photo, :photo_cache)
  end

end
