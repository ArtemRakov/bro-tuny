class CreateStages < ActiveRecord::Migration[5.2]
  def change
    create_table :stages do |t|
      t.string :title
      t.datetime :end_date
      t.string :photo
      t.boolean :finish
      t.string :description
      t.references :house_complex, foreign_key: true
      t.references :house, foreign_key: true

      t.timestamps
    end
  end
end
