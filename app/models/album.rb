class Album < ActiveRecord::Base
  attr_accessible :band_id, :name, :album_type

  belongs_to :band, class_name: "Band", foreign_key: :band_id, primary_key: :id
  has_many :tracks, class_name: "Track",
           foreign_key: :album_id, primary_key: :id, :dependent => :destroy

  validates :band_id, :name, presence: true
  validates :name, uniqueness: {scope: :band_id}
  ALBUM_TYPES = %w{live studio}
  validates :album_type, :inclusion => {:in => ALBUM_TYPES }
end
