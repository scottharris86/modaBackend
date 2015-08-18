class FavoritesController < ApplicationController
    before_filter :authenticate_user!
    respond_to :json
    require 'parse_forecast'
    include ParseForecastHelper

    def create
      @fav = current_user.favorites.create()
      @fav.location = Location.create(name: params[:name], longitude: params[:longitude], latitude: params[:latitude])
      @location = @fav.location
      forecast = ForecastIO.forecast(@location.latitude, @location.longitude)

      parsed_data = serializeData(forecast)

      @location.current_forecast = CurrentForecast.create(parsed_data[:current])
      parsed_data[:dailys].each do |day|
        @location.daily_forecasts.create(day)
      end
      render json: @location, status: 201 and return
    end

    def index
      @favorites = current_user.favorites
      @favorites.each do |favorite|
        forecast = ForecastIO.forecast(favorite.location.latitude, favorite.location.longitude)

        parsed_data = serializeData(forecast)

        favorite.location.current_forecast.update(parsed_data[:current])

        favorite.location.daily_forecasts.each_with_index do |day, index|
          day.update(parsed_data[:dailys][index])
        end
      end
      render json: @favorites, status: 201 and return
    end

    def destroy
      @favorite = Favorite.find_by(id: params[:id])
      @favorite.destroy
      render json: 'ok', status: 201 and return
    end
end
