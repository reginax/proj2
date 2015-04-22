class RenameUserToFarmer < ActiveRecord::Migration
  def change
    rename_table :users, :farmers
  end
end
