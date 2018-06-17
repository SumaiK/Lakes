class HolidayAlbumsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @holiday = Holiday.find(params[:holiday_id])
    @holiday_albums = HolidayAlbum.all
  end

  def show
    @holiday_album = HolidayAlbum.find(params[:id])
    authorize @holiday_album
  end

  def new
    @holiday_album = HolidayAlbum.new
    @holiday = Holiday.find(params[:holiday_id])
    authorize @holiday_album
  end

  def create
    @holiday_album = HolidayAlbum.new(holiday_album_params)
    @holiday = Holiday.find(params[:holiday_id])
    @holiday_album.holiday = @holiday
    if @holiday_album.save
      redirect_to holiday_album_path(@holiday_album)
    else
      flash.now[:error] = "Album was not saved"
      render :new
    end
    authorize @holiday_album
  end

  def edit
    @holiday_album = HolidayAlbum.find(params[:id])
    # authorize @holiday_album
  end

  def update
    # @holiday = Holiday.find(params[:holiday_id])
    @holiday_album = HolidayAlbum.find(params[:id])
    @holiday_album.update(holiday_album_params)
    if @holiday_album.save
      redirect_to holiday_album_path(@holiday_album)
    else
      render :new
    end
    authorize @holiday_album
  end

  def destroy
    @holiday_album = HolidayAlbum.find(params[:id])
    @holiday_album.destroy
    redirect_to holiday_albums_path
    # authorize @holiday_album
  end

  private

  def holiday_album_params
    params.require(:holiday_album).permit(:name, :image)
  end
end
