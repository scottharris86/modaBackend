class CreateCurrentForecasts < ActiveRecord::Migration
  def change
    create_table :current_forecasts do |t|
      t.integer :time
      t.string :summary
      t.string :icon
      t.integer :precip_intensity
      t.integer :precip_probability
      t.integer :temperature
      t.integer :apparent_temperature
      t.float :dew_point
      t.float :humidity
      t.integer :wind_speed
      t.integer :visibility
      t.float :cloud_cover
      t.float :pressure
      t.references :location
      t.timestamps
    end
  end
end
