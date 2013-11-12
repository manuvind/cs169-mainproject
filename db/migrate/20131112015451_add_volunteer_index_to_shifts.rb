class AddVolunteerIndexToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :volunteer_id, :integer
    add_index :shifts, :volunteer_id
  end
end
