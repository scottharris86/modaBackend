class CreateDailyForecasts < ActiveRecord::Migration
  def change
    create_table :daily_forecasts do |t|
      t.integer :time
      t.string :summary
      t.string :icon
      t.integer :sunrise_time
      t.integer :sunset_time
      t.float :moon_phase
      t.integer :precip_intensity
      t.integer :precip_probability
      t.string :precip_type
      t.integer :temperature_min
      t.integer :temperature_max
      t.float :dew_point
      t.float :humidity
      t.float :wind_speed
      t.integer :visibility
      t.float :cloud_cover
      t.float :pressure
      t.references :location
      t.timestamps
    end
  end
end
