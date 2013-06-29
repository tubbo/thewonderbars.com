begin
  require 'airbrake'

  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
  end
rescue LoadError
  Rails.logger.warn "Warning: Errors are not being monitored."
end
