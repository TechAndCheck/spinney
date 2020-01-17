class ApplicationController < ActionController::API
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
end
