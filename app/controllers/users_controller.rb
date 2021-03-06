class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  # before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    # @user = User.find(params[:id]) not needed cause of set_user method below
    @holidays = Holiday.all
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
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
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
