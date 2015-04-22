class Farmer < ActiveRecord::Base
	has_many :plants
	has_many :animals
end
