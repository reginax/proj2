class HomeController < ApplicationController

  def index
  	flash[:notice] = "todo, change css for gritter"
    spaceless_plant = Plant.all
    @plant = spaceless_plant.sample
    # @plant.space_id = 1
  end

end
