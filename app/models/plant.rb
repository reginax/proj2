class Plant < ActiveRecord::Base
	belongs_to :space

	validates :name, presence: true
end
