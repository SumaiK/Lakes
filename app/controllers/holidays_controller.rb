class HolidaysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @holidays = Holiday.all
  end

  def show
    @holiday = Holiday.find(params[:id])
    # @holidays_albums = HolidayAlbums.all
    authorize @holiday
  end

  def new
    @holiday = Holiday.new
    authorize @holiday
  end

  def create
    @holiday = Holiday.new(holiday_params)
    @holiday.owner = current_user
    if @holiday.save
      redirect_to holiday_path(@holiday)
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
    @holiday = Holiday.find(params[:id])
    @holiday.update(holiday_params)
    if @holiday.save
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

  def holiday_params
    params.require(:holiday).permit(:name, :location, :details, :date_start, :date_end)
  end

end
