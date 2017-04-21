class CreateUserAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :user_addresses do |t|
      t.string :name
      t.integer :tel
      t.string :sex
      t.string :city
      t.string :region
      t.string :community
      t.string :house_number
      t.integer :user_id
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
