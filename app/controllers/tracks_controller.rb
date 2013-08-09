class TracksController < ApplicationController
  def index
    @tracks = Track.all
    render :index
  end

  def new
    @track = Track.new
    render :new
  end
end
