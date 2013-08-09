class Track < ActiveRecord::Base
  attr_accessible :album_id, :lyrics, :name, :story
  validates :album_id, :name, presence: true

  belongs_to :album, class_name: "Album", primary_key: :id, foreign_key: :album_id
  has_one :band, through: :album, source: :band
end
