class HomeController < ApplicationController

  def index
  	# flash[:notice] = "todo, change css for gritter"
    # gflash :success => "The product has been created successfully!"
    spaceless_plant = Plant.all
    @plant = spaceless_plant.sample
    # @plant.space_id = 1
  end

end
