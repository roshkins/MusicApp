class AlbumsController < ApplicationController
  # def index
  #   @band = Band.find(params[:band_id])
  #   @albums = Band.albums
  #   render :index
  # end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    @band = @album.band
    render :edit
  end

  def create
    @album = Album.new(params[:album])
    @album.band_id= params[:band_id]
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:message] = "Someone's wrong here"
      redirect_to new_band_album(params[:band_id])
    end
  end

  def update
    album = Album.find(params[:id])
    if album.update_attributes(params[:album])
      redirect_to album_url(album)
    else
      flash[:message]= "Someone's wrong here"
      redirect_to edit_album_url(album)
    end
  end

  def destroy
    album = Album.find(params[:id])
    album.destroy
    redirect_to band_url(album.band)
  end
end
