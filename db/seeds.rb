# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'forecast_io'
require 'parse_forecast'
include ParseForecastHelper
ForecastIO.api_key = '63f4415f4e3b0d2283fd836c517b503d'

if !User.any?
  User.create(email: 'test1@test.com', password: 'password')
  User.create(email: 'test2@test.com', password: 'password')
  User.create(email: 'test3@test.com', password: 'password')
end

if !Location.any?
  Location.create(name: 'NYC, New York', longitude: -74.00594, latitude: 40.71278)
  Location.create(name: 'London, United Kingdom', longitude: -0.1015987, latitude: 51.5286416)
  Location.create(name: 'Hong Kong', longitude: 114.121017, latitude: 22.3576782)
  @locations = Location.all
  @locations.each do |location|
    forecast = ForecastIO.forecast(location.latitude, location.longitude)
    parsed_data = serializeData(forecast)
    location.current_forecast = CurrentForecast.create(parsed_data[:current])
    parsed_data[:dailys].each do |day|
      location.daily_forecasts.create(day)
    end
  end
end

if !DefaultLocation.any?
  @default = DefaultLocation.create()
  @default.location = Location.find_by(id: 1)
  @default = DefaultLocation.create()
  @default.location = Location.find_by(id: 2)
  @default = DefaultLocation.create()
  @default.location = Location.find_by(id: 3)
end

