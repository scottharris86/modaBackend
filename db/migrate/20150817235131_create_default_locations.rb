class CreateDefaultLocations < ActiveRecord::Migration
  def change
    create_table :default_locations do |t|

      t.timestamps
    end
  end
end
