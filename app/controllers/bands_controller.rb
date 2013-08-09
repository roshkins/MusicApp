class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def create
    band = Band.new(params[:band])
    if band.save
      redirect_to band_url(band)
    else
      flash[:message]="No, try again"
      redirect_to new_band_url
    end
  end

  def update
    band = Band.find(params[:id])
    if band.update_attributes(params[:band])
      redirect_to band_url(band)
    else
      flash[:message]="No"
      redirect_to edit_band_url(band)
    end
  end

  def destroy
    Band.find(params[:id]).destroy
    redirect_to bands_url
  end
end
