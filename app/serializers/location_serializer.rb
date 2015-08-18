class LocationSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes(*Location.attribute_names.map(&:to_sym))
  has_one :current_forecast
  has_many :daily_forecasts
  has_one :locatable, :polymorphic => true
end
