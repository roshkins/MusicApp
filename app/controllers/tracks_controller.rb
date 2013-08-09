class TracksController < ApplicationController
  # def index
  #   @tracks = Track.all
  #   render :index
  # end

  def new
    @album = Album.find(params[:album_id])
    @track = @album.tracks.new
    render :new
  end

  def create
    track = Track.new(params[:track])
    if track.save
      redirect_to track_url(track)
    else
      flash[:message]="Seriously?"
      redirect_to new_album_track_url
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @album = @track.album
    render :edit
  end

  def update
    track = Track.find(params[:id])

    if track.update_attributes(params[:track])
      redirect_to track_url(track)
    else
      flash[:message]="Seriously?"
      redirect_to edit_track_url(track)
    end

  end

  def destroy
    track = Track.find(params[:id])
    if track.destroy
      redirect_to album_url(track.album)
    else
      flash[:message] = "Cannot be destroyed. WHAT HAVE YOU DONE?!?!1!"
      redirect_to :back
    end
  end
end
