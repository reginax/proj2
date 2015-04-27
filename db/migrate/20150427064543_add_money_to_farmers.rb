class AddMoneyToFarmers < ActiveRecord::Migration
  def change
  	add_column :farmers, :dolladollabillz, :integer
  end
end
