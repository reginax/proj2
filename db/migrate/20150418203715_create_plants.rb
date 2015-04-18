class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :birthTime
      t.integer :maturation

      t.timestamps
    end
  end
end
