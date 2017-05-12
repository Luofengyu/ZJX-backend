class CreateUserCards < ActiveRecord::Migration[5.0]
  def change
    create_table :user_cards do |t|
      t.float :real_money
      t.float :fake_money
      t.integer :user_id

      t.timestamps
    end
  end
end
