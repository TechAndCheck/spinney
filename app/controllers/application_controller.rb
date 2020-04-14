class ApplicationController < ActionController::API
  before_action :set_raven_request_context
  before_action :authorize_api_key
  before_action :set_raven_user_context

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
    key.first.update last_used: DateTime.now
    session[:current_key_id] = key.first.id
  end

private

  # Add details to our error logging
  def set_raven_request_context
    # We want to log what's passed in for errors
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  # If a user is proper we want to log them too
  def set_raven_user_context
    # If there is no key set let's just return
    return if session[:current_key_id].nil?

    # If there is a key, we'll log the id and the name used
    key = ApiKey.where(id: session[:current_key_id]).first
    Raven.user_context(id: key.id, name: key.name) # or anything else in session
  end
end
