class HolidaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @holiday = Holiday.all
  end

  def show
    @holiday = Holiday.find(params[:id])
    @holidays_albums = HolidayAlbums.all
    authorize @holiday
  end

  def new
    @holiday = Holiday.new(holiday_params)
    authorize @holiday
  end

  def create
    @project = Holiday.new(holiday_params)
    if holiday.save
      redirect_to holidays_path(@holiday)
    else
      render :new
    end
    authorize @holiday
  end

  def edit
    @holiday = Holiday.find(params[:id])
    authorize @holiday
  end

  def update
    @holiday = current_user
    @holiday.update(holiday_params)
    if holiday.save
      redirect_to holiday_path(@holiday)
    else
      render :new
    end
    authorize @holiday
  end

  def destroy
    @holiday = Holiday.find(params[:id])
    @holiday.destroy
    redirect_to holidays_path
    authorize @holiday
  end

  private

  def holdiay_params
    params.require(:holiday).permit(:name, :location, :details, :date_start, :date_end, :photo)
  end

end
