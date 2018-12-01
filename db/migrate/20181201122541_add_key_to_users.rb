class AddKeyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :house, index: true, foreign_key: true
  end
end
