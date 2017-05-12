class CreatePromotionRules < ActiveRecord::Migration[5.0]
  def change
    create_table :promotion_rules do |t|
      t.date :start_on
      t.date :end_on
      t.references :coupon_list, foreign_key: true

      t.timestamps
    end
  end
end
