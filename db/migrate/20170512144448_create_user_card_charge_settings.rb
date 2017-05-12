class CreateUserCardChargeSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :user_card_charge_settings do |t|
      t.float :min
      t.float :money_give
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
