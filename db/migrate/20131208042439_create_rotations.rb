class CreateRotations < ActiveRecord::Migration
  def change
    create_table :rotations do |t|
      t.string :title
      t.text :description
      t.datetime :time
      t.integer :event_id

      t.timestamps
    end
  end
end
