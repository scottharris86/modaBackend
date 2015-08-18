require 'test_helper'
require 'parse_forecast'
require 'forecast_io'
include ParseForecastHelper
class ParseForecastHelperTest < ActionController::TestCase

  def setup
    ForecastIO.api_key = '63f4415f4e3b0d2283fd836c517b503d'
    @forecast = ForecastIO.forecast(40.71278, -74.00594)
  end

  test "i can recieve a forecast from api" do
    assert_not_nil(@forecast, "forecast was nil when it wasnt supposed to be")
  end

  test "i can properly parse data from helper method" do
    @response = serializeData(@forecast)
    assert_not_nil(@response, "response from serializeData was nil.. something went wrong")
    assert_not_nil(@response[:dailys])
    assert_instance_of(Hash, @response, "serializeData did not return a hash object")
  end

  test "can save model with data from serializeData" do
     @response = serializeData(@forecast)
    current = CurrentForecast.new(@response['current'])
    assert_not_nil(@response[:dailys])
    assert_instance_of(Array, @response[:dailys])
    daily = DailyForecast.new(@response[:dailys].first)
    assert current.save
    assert daily.save
  end

end
