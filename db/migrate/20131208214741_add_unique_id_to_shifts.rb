class AddUniqueIdToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :uniq_id, :string
  end
end
