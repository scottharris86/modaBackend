class DefaultLocationsController < ApplicationController
  before_filter :authenticate_user!
  respond_to :json
  require 'parse_forecast'
  include ParseForecastHelper


  def index
    if request.format.json?

      @default_locations = DefaultLocation.all
      @default_locations.each do |default|
        forecast = ForecastIO.forecast(default.location.latitude, default.location.longitude)
        parsed_data = serializeData(forecast)
        default.location.current_forecast.update(parsed_data[:current])
        default.location.daily_forecasts.each_with_index do |day, index|
          day.update(parsed_data[:dailys][index])
        end
      end

      render json: @default_locations, status: 201 and return

    end
  end

  def show
    if request.format.json?
      @default_location = DefaultLocation.find_by(id: params[:id])
      forecast = ForecastIO.forecast(@default_location.location.latitude, @default_location.location.longitude)
      parsed_data = serializeData(forecast)
      @default_location.location.current_forecast.update(parsed_data[:current])
      @default_location.location.daily_forecasts.each_with_index do |day, index|
        day.update(parsed_data[:dailys][index])
      end

      render json: @default_location, status: 201 and return

    end
  end
end
