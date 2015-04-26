class Space < ActiveRecord::Base
	belongs_to :farmer
	has_many :plants
	validates :name, presence: true, uniqueness: true
end
