class ApplicationController < ActionController::API
  before_action :set_raven_context
  before_action :authorize_api_key

  # Check if there's a proper API key before every request
  # This is technically susceptible to timing attacks, but I'm not concerned.
  def authorize_api_key
    # If it's blank, send a 403
    if params[:api_key].blank?
      head :forbidden
      return
    end

    # Search for the key
    key = ApiKey.where(key: params[:api_key])

    # If there's no key, it's not authorized, 403 it
    if key.blank?
      head :forbidden
      return
    end

    # Update the key with the current time so we know it's being used
    key.update last_used: DateTime.now
  end

private

  # Raven is Sentry.io's bug catcher client. We just return if we don't have it enabled
  def set_raven_context
    return if ENV["SENTRY_DSN"]

    # So this is sending the api_key directly to the logs. Probably... not the best idea, but I
    # also don't want to do a db call and use the same logic as in `authorize_keys` here.
    Raven.user_context(id: params[:api_key]) unless params[:api_key].blank? # or anything else in session
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
