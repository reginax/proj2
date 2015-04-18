class PlantsController < ApplicationController
  def new
    @plant = Plant.new
  end

  def create
    @health = 100
    @level = 1
    @plant = Plant.create(plant_params)
    if @plant.save 
      redirect_to current_farmer
    else
      flash[:error] = @plant.errors.full_messages.to_sentence
      render "new"
    end
  end

  def plant_params
    params.require(:plant).permit(:name)
  end


  def harvest
    @plant = Plant.find(params[:id])
    @plant.farmer = current_farmer
    if @plant.save
      redirect_to root_path
    end
  end
end
