class AddRecurringToEvents < ActiveRecord::Migration
  def change
  	add_column :events, :repeating, :boolean
  	add_column :events, :repeat_to, :date
  	add_column :events, :current_rotation, :integer
  end
end
