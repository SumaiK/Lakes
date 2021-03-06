class PhotosController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @photo = Photo.find(params[:id])
    authorize @photo
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(params[:id])
    if @photo.save
      redirect_to @photo
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    authorize @photo
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update
    if @photo.save
      redirect_to photo_path(@photo)
    else
      render :edit
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to photos_path
    authorize @photo
  end

  # private

  # def photo_params
  #   params.require(:photo).permit(:title, :location, :caption)
  # end
end
