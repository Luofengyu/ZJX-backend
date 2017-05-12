class CreateFactorySettlementRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :factory_settlement_records do |t|
      t.references :factory, foreign_key: true
      t.references :category, foreign_key: true
      t.references :product, foreign_key: true
      t.date :settlement_on
      t.integer :amount
      t.float :price
      t.float :money

      t.timestamps
    end
  end
end
