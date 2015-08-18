module ParseForecastHelper
  def serializeData(params)

    current_forecast = Hash.new
    daily_forecasts = Array.new

    temp_current = JSON.parse(params['currently'].to_json.underscore)

    current_forecast = temp_current.slice('time', 'summary', 'icon', 'precip_intensity',
                                          'precip_probability', 'temperature', 'apparent_temperature',
                                          'dew_point', 'humidity', 'wind_speed', 'visibility',
                                          'cloud_cover', 'pressure')

    temp_daily = []
    days = JSON.parse(params['daily'].to_json.underscore)

    days['data'].each do |day|
      d = Hash.new

      d = day.slice('time', 'summary', 'icon', 'precip_intensity',
                      'precip_probability', 'precip_intensity', 'temperature_min', 'apparent_temperature',
                      'dew_point', 'humidity', 'wind_speed', 'visibility', 'temperature_max',
                      'cloud_cover', 'pressure', 'sunrise_time', 'sunset_time', 'moon_phase', 'precip_type')


      daily_forecasts << d
    end
    response = Hash.new
    response[:current] = current_forecast
    response[:dailys] = daily_forecasts
    return response

  end
end
