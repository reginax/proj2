class Plant < ActiveRecord::Base
  @@matdict = {"Potato" => 20, "Squash" => 40, "Wintermelon" => 50, "Corn" => 60, "Strawberry" => 55, "Fries" => 20}
 
	belongs_to :farmer
end
