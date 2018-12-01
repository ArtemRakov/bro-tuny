class AddPositionToStages < ActiveRecord::Migration[5.2]
  def change
    remove_column :houses, :position
    add_column :stages, :position, :integer
  end
end
