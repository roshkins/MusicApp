class Note < ActiveRecord::Base
  attr_accessible :note, :track_id, :user_id
  validates :note, :track_id, :user_id, presence: true

  belongs_to :track, class_name: "Track", primary_key: :id, foreign_key: :track_id
  belongs_to :user, class_name: "User", primary_key: :id, foreign_key: :user_id
end
