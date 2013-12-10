class AddAvailableToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :available, :boolean
  end
end
