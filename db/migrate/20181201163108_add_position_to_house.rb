class AddPositionToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :position, :integer
  end
end
