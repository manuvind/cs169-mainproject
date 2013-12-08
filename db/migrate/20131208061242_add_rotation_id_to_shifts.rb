class AddRotationIdToShifts < ActiveRecord::Migration
  def change
  	add_column :shifts, :rotation_id, :integer
  end
end
