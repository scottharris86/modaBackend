class SearchesController < ApplicationController
  before_filter :authenticate_user!
  require 'parse_forecast'
  include ParseForecastHelper
  respond_to :json

  def index
    if request.format.json?
      @search = Search.create()
      @search.location = Location.create(longitude: params[:longitude], latitude: params[:latitude], name: params[:name])

      @location = @search.location

      forecast = ForecastIO.forecast(@location.latitude, @location.longitude)

      parsed_data = serializeData(forecast)

      @location.current_forecast = CurrentForecast.create(parsed_data[:current])
      parsed_data[:dailys].each do |day|
        @location.daily_forecasts.create(day)
      end

      render json: [@search], status: 201 and return
    end
  end
end
