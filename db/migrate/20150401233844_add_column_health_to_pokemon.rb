class AddColumnHealthToPlant < ActiveRecord::Migration
  def change
  	add_column :plants, :health, :integer
  end
end
