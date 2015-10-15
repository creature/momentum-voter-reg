class VoterRegistrationAction < ActiveRecord::Base
  geocoded_by :meeting_point
  scope :published, -> { where("published = ?", true) }
  scope :unpublished, -> { where("published != ?", true) }
end
