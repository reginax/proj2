class PlantsController < ApplicationController

	def plot
		current_farmer.dolladollabillz += 5
		@plotted = Plant.find(params[:id])
		# @plotted.space_id = current_space.id
		@plotted.save
		redirect_to root_path
	end

	def harvest
		current_farmer.dolladollabillz += 10
		@harvested = Plant.find(params[:id])
		@harvested.destroy
		@harvested.save
		redirect_to @harvested.space
	end

	def water
		@watered = Plant.find(params[:id])
		@watered.health += 10
		@watered.save
		redirect_to @watered.space
	end


	def new
		@plant = Plant.new
	end

	def buy
		@farmer = current_farmer
		if !@farmer.dolladollabillz?
			@farmer.dolladollabillz = 11
		end
		if @farmer.dolladollabillz < 11
			flash[:error] = "Not enough money"
		else 
			@farmer.dolladollabillz -= 10
		end
		@farmer.save
    newplant = Plant.create(name: params[:type])
    targetspace = current_farmer.spaces.where(filled:0).sample
    newplant.space = targetspace
    targetspace.plant = newplant
    targetspace.filled = 1
		redirect_to root_path
	end

	 def create
	 	if !current_farmer.space
	 		current_farmer.space = Space.create(name: current_farmer.email).save
	 		current_farmer.space.farmer_id = current_farmer.id
	 	end
    	@plant = Plant.create(plant_params)
    	@plant.health = 100
		@plant.level = 1
		@plant.space_id = current_farmer.space.id
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
