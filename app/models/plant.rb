class Plant < ActiveRecord::Base
	belongs_to :farmer

	validates :name, presence: true, uniqueness: true
end
