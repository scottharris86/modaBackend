class LocationsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  require 'parse_forecast'
  include ParseForecastHelper

  def create
    @location = current_user.locations.create(name: params[:name], longitude: params[:longitude], latitude: params[:latitude])

    forecast = ForecastIO.forecast(@location.latitude, @location.longitude)

    parsed_data = serializeData(forecast)

    @location.current_forecast = CurrentForecast.create(parsed_data[:current])
    parsed_data[:dailys].each do |day|
      @location.daily_forecasts.create(day)
    end
    render json: @location, status: 201 and return
  end

end
