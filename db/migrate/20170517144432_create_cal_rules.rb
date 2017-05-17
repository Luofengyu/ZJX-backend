class CreateCalRules < ActiveRecord::Migration[5.0]
  def change
    create_table :cal_rules do |t|
      t.float :base
      t.float :extra
      t.integer :person_type
      t.string :desc

      t.timestamps
    end
  end
end
