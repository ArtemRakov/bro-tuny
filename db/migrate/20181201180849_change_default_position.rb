class ChangeDefaultPosition < ActiveRecord::Migration[5.2]
  def change
    change_column :stages, :status, :integer, :default => 1
  end
end
