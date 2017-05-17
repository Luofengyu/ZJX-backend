class CreateWorkerRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :worker_roles do |t|
      t.references :worker, foreign_key: true
      t.references :role, foreign_key: true

      t.timestamps
    end
  end
end
