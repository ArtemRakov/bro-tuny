class FixStages < ActiveRecord::Migration[5.2]
  def change
    remove_column :stages, :finish
    add_column :stages, :status, :integer, default: 0
    add_column :users, :telegram, :string
    add_column :users, :phone_number, :string
  end
end
