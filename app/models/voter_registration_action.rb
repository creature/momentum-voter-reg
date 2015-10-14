class VoterRegistrationAction < ActiveRecord::Base
  geocoded_by :meeting_point
end
