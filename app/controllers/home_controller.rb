class HomeController < ApplicationController

  def index
    farmerless_plant = Plant.where(farmer:nil)
    @plant = farmerless_plant.sample
  end

end
