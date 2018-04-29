class HolidaysController < ApplicationController
  before_acion :authenticate_user!, only: [:index, :show]

  def index
    @holidays = Holidays.all
  end

  def show
    @holiday = Holiday.find(params[:id])
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @project = Holiday.new(holiday_params)
  end

  def edit
    @holiday = Holiday.find(params[:id])
  end

  def update
    @holiday = current_user
    @holiday.update(holiday_params)
  end

  private

  def holdiay_params
    params.require(:holiday).permit(:name, :location, :details, :date_start, :date_end, :photo, :photo_cache)
  end

end
