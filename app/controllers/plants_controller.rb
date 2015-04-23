class PlantsController < ApplicationController
	def plot
		@plotted = Plant.find(params[:id])
		@plotted.farmer_id = current_farmer.id
		@plotted.save
		redirect_to root_path
	end

	def harvest
		@harvested = Plant.find(params[:id])
		@harvested.destroy
		@harvested.save
		redirect_to @harvested.farmer
	end

	def water
		@watered = Plant.find(params[:id])
		@watered.health += 10
		@watered.save
		redirect_to @watered.farmer
	end


	def new
		@plant = Plant.new
	end

	 def create
    	@plant = Plant.create(plant_params)
    	@plant.health = 100
		@plant.level = 1
		@plant.farmer_id = current_farmer.id
		@plant.save
    	if @plant.save
      		redirect_to current_farmer
    	else
      		flash[:error] = @plant.errors.full_messages.to_sentence
      		render "new"
    	end
  	end


  private

  def plant_params
    params.require(:plant).permit(:name)
  end
end