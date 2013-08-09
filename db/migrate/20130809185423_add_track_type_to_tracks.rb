class AddTrackTypeToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :track_type, :string, null: false, default: "regular"
  end
end
