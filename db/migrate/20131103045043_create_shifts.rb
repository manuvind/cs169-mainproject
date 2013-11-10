class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.string :title
      t.string :description
      t.datetime :start
      t.datetime :end
      t.references :event

      t.timestamps
    end
    add_index :shifts, :event_id
  end
end
