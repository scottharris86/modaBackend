class DailyForecastSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes(*DailyForecast.attribute_names.map(&:to_sym))
  has_one :location
end
