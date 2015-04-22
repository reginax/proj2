class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.integer :birthTime
      t.integer :maturation

      t.timestamps
    end
  end
end
