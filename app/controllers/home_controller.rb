class HomeController < ApplicationController

  def index
  	# flash[:notice] = "todo, change css for gritter"
    farmerless_plant = Plant.where(farmer:nil)
    @plant = farmerless_plant.sample
  end

end
