class CreateCouriersStations < ActiveRecord::Migration[5.0]
  def change
    create_table :couriers_stations do |t|
      t.integer :courier_id
      t.integer :station_id

      t.timestamps
    end
  end
end
