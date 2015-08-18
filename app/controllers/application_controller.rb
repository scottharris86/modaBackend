class ApplicationController < ActionController::Base
  require 'forecast_io'
  ForecastIO.api_key = '63f4415f4e3b0d2283fd836c517b503d'
  before_filter :authenticate_user_from_token!
  # Enter the normal Devise authentication path,
  # using the token authenticated user if available
  before_filter :authenticate_user!

  private

  def authenticate_user_from_token!
    authenticate_with_http_token do |token, options|
      user_email = options[:email].presence
      user = user_email && User.find_by_email(user_email)

      if user && Devise.secure_compare(user.authentication_token, token)
        sign_in user, store: false
      end
    end
  end
end
