class NotesController < ApplicationController
  def create
    current_user = {:id => 1}
    track = Track.find(params[:track_id])
    note = track.notes.new(params[:note])
    note.user_id = current_user[:id]
    if note.save
      redirect_to track_url(note.track)
    else
      flash[:message] = "That note is not ok"
      redirect_to :back
    end
  end

  def destroy
    note = Note.find(params[:id])
    if note.destroy
      redirect_to :back
    else
      flash[message] = "I refuse to do your bidding"
      redirect_to :back
    end
  end
end
