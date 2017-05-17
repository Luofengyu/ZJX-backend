class CreateFactoryCards < ActiveRecord::Migration[5.0]
  def change
    create_table :factory_cards do |t|
      t.float :money
      t.integer :factory_id
      t.string :desc

      t.timestamps
    end
  end
end
