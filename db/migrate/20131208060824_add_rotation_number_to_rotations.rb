class AddRotationNumberToRotations < ActiveRecord::Migration
  def change
    add_column :rotations, :number, :integer
  end
end
