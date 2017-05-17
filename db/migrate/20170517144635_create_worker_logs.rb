class CreateWorkerLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :worker_logs do |t|
      t.integer :kind
      t.float :money
      t.integer :worker_id
      t.string :desc

      t.timestamps
    end
  end
end
