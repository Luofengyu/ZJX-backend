class CreateCourierCards < ActiveRecord::Migration[5.0]
  def change
    create_table :courier_cards do |t|
      t.float :money
      t.integer :courier_id
      t.string :desc

      t.timestamps
    end
  end
end
