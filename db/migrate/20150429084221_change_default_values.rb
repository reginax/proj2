class ChangeDefaultValues < ActiveRecord::Migration
  def change
  	change_column_null :farmers, :dolladollabillz, false
  	change_column_default :farmers, :dolladollabillz, 30
  end
end
