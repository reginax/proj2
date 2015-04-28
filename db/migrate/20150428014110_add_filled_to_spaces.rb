class AddFilledToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :filled, :integer
  end
end
