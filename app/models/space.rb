class Space < ActiveRecord::Base
	belongs_to :farmer
	has_one :plant
	validates :name, presence: true
end
