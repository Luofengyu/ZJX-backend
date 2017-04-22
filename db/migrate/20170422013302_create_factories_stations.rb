class CreateFactoriesStations < ActiveRecord::Migration[5.0]
  def change
    create_table :factories_stations do |t|
      t.integer :factory_id
      t.integer :station_id

      t.timestamps
    end
  end
end
