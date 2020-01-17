# Don't initialize anything if we're not using Sentry.
return if ENV["SENTRY_API_KEY"].blank?

# Add Rails's filtered params to Sentry's list as well.
Raven.configure do |config|
  config.sanitize_fields = Rails.application.config.filter_parameters.map(&:to_s)
end
