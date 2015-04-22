class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :level
      t.integer :farmer_id

      t.timestamps
    end
  end
end
