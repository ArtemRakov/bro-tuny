class CreateHouseComplexes < ActiveRecord::Migration[5.2]
  def change
    create_table :house_complexes do |t|
      t.string :logo
      t.string :name
      t.string :address
      t.references :developer, foreign_key: true

      t.timestamps
    end
  end
end
