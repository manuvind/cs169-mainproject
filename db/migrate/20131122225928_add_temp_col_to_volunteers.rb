class AddTempColToVolunteers < ActiveRecord::Migration
  def change
  	add_column :volunteers, :temp, :boolean
  end
end
