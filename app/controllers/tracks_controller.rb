class TracksController < ApplicationController
  # def index
  #   @tracks = Track.all
  #   render :index
  # end

  def new
    @album = Album.find(params[:album_id])
    @track = Track.new
    render :new
  end
end
