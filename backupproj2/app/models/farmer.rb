class Farmer < ActiveRecord::Base
	devise :database_authenticatable, :registerable, 
		   :recoverable, :rememberable, :trackable, :validatable
	has_many :plants
	has_many :animals
end
