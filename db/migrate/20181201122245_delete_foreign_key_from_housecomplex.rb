class DeleteForeignKeyFromHousecomplex < ActiveRecord::Migration[5.2]
  def change
    remove_reference :stages, :house_complex, index: true, foreign_key: true
  end
end
