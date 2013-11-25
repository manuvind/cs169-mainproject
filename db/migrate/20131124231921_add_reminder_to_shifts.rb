class AddReminderToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :reminder, :datetime
  end
end
