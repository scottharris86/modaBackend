class CurrentForecastSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes(*CurrentForecast.attribute_names.map(&:to_sym))
  has_one :location
end
