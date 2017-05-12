class CreateCitiesPromotionRules < ActiveRecord::Migration[5.0]
  def change
    create_table :cities_promotion_rules do |t|
      t.references :city, foreign_key: true
      t.references :promotion_rule, foreign_key: true

      t.timestamps
    end
  end
end
