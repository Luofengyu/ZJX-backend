class CreateFactoryLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :factory_logs do |t|
      t.integer :kind
      t.float :money
      t.integer :factory_id
      t.string :desc

      t.timestamps
    end
  end
end
