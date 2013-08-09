class Track < ActiveRecord::Base
  attr_accessible :album_id, :lyrics, :name, :story, :track_type
  validates :album_id, :name, presence: true
  TRACK_TYPES = %w{bonus regular}
  validates :track_type, :inclusion => {:in => TRACK_TYPES}

  belongs_to :album, class_name: "Album", primary_key: :id, foreign_key: :album_id
  has_one :band, through: :album, source: :band
end
