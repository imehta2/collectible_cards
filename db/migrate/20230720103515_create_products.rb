class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :status
      t.string :species
      t.string :gender
      t.string :location
      t.string :dimension
      t.string :image

      t.timestamps
    end
  end
end
