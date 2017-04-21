class CreateFactoryAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :factory_addresses do |t|
      t.string :name
      t.string :tel
      t.string :sex
      t.string :city
      t.string :region
      t.string :community
      t.string :house_number
      t.integer :factory_id
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
