if ENV['GEOCODER_API_KEY'].present?
  Geocoder.configure(api_key: ENV['GEOCODER_API_KEY'])
end
