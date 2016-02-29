class Api::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  def authenticate!
    render status: :unauthorized,
           json: { errors: ["Requires authorization."] } unless authenticated
  end

  protected
  def authenticated
    # Skip the trackable of Devise, because it's API request, right?
    request.env['devise.skip_trackable'] = true

    user_email = request.headers["X-Api-Email"].presence
    auth_token = request.headers["X-Api-Token"].presence
    user       = user_email && User.find_by_email(user_email.downcase)

    if user && user.devices.find_by_token(auth_token)
      sign_in user, store: false
    end
  end

  private
  # Don't use login in API side!
  def logging
  end
end
