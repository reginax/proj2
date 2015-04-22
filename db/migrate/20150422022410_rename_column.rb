class RenameColumn < ActiveRecord::Migration
  def change
  rename_table :trainers, :farmers
  rename_table :pokemons, :plants
  end
end
