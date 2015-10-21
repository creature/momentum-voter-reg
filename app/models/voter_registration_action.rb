class VoterRegistrationAction < ActiveRecord::Base
  geocoded_by :meeting_point
  scope :published, -> { where("published = ?", true) }
  scope :unpublished, -> { where("published != ?", true) }

  validate :url_format

  private

  def url_format
    unless url.blank?
      begin
        parsed = URI.parse(url)
        unless parsed.is_a?(URI::HTTP)
          errors.add(:url, "Isn't a correctly formatted link. Did you remember the 'http://'?")
        end
      rescue URI::InvalidURIError
        errors.add(:url, "is not in a valid format")
      end
    end
  end
end
