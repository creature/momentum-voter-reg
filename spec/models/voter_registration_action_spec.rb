require 'rails_helper'

RSpec.describe VoterRegistrationAction, type: :model do
  describe "URL validation" do
    it "Does not require a URL" do
      model = VoterRegistrationAction.new
      expect(model).to be_valid
    end

    it "Considers HTTP and HTTPS URLs valid" do
      model = VoterRegistrationAction.new(url: "http://example.com")
      expect(model).to be_valid

      model = VoterRegistrationAction.new(url: "https://example.com")
      expect(model).to be_valid
    end

    it "Considers nonsense to be invalid" do
      model = VoterRegistrationAction.new(url: "lkjdflgkjdlfgkjdlkfjg")
      expect(model).not_to be_valid
    end

    it "Considers URLs without a protocol invalid" do
      model = VoterRegistrationAction.new(url: "www.facebook.com/events/565809330233252/")
      expect(model).not_to be_valid
    end
  end
end
