# Configure Sentry.io, specifically to remove anything we're filtering from the logs.
Raven.configure do |config|
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
