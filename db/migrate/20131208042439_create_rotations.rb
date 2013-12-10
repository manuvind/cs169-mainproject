class CreateRotations < ActiveRecord::Migration
  def change
    create_table :rotations do |t|
      t.integer :number
      t.integer :event_id

      t.timestamps
    end
  end
end
