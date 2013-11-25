class AddRecurringColumnToVolunteer < ActiveRecord::Migration
  def change
  	add_column :volunteers, :recurring, :boolean, default: true
  end
end
