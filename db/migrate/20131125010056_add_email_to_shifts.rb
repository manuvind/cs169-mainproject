class AddEmailToShifts < ActiveRecord::Migration
  def change
    add_column :shifts, :email, :text
  end
end
