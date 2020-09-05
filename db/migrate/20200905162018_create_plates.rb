class CreatePlates < ActiveRecord::Migration[6.0]
  def change
    create_table :plates do |t|
      t.string :name
      t.string :meal
      t.text :description

      t.timestamps
    end
  end
end
