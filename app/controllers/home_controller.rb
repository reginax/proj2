class HomeController < ApplicationController

  def index
  	# flash[:notice] = "todo, change css for gritter"
    spaceless_plant = Plant.where(space:nil)
    @plant = spaceless_plant.sample
  end

end
