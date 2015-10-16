if ENV['GEOCODER_API_KEY'].present?
  Geocoder.configure(api_key: ENV['GEOCODER_API_KEY'])
end
if Rails.env == "development"
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end
