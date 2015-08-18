class Location < ActiveRecord::Base
  has_one :current_forecast, dependent: :destroy
  has_many :daily_forecasts, dependent: :destroy
  belongs_to :locatable, :polymorphic => true
end
