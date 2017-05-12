class CreateUserCardLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_card_logs do |t|
      t.integer :kind
      t.float :real_money
      t.float :fake_money
      t.string :loggable_type
      t.integer :loggable_id
      t.references :user_card, foreign_key: true

      t.timestamps
    end
  end
end
