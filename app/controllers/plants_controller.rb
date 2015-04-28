class PlantsController < ApplicationController

	def plot
		if !current_farmer.dolladollabillz?
			@current_farmer.dolladollabillz = 0
		end
		current_farmer.dolladollabillz += 2
		current_farmer.save
		@plotted = Plant.find(params[:id])
		# @plotted.space_id = current_space.id
		@plotted.save
		redirect_to root_path
	end

	def harvest
		if !current_farmer.dolladollabillz?
			current_farmer.dolladollabillz = 0
		end
		current_farmer.dolladollabillz += 5
		current_farmer.save
		@harvested = Plant.find(params[:id])
		@harvested.destroy
		@harvested.save
		redirect_to root_path
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
			@farmer.dolladollabillz = 0
		end
		if @farmer.dolladollabillz < 5
			flash[:error] = "Not enough money"
		else 
			@farmer.dolladollabillz -= 5
		end
		@farmer.save
    newplant = Plant.create(name: params[:type])
    targetspace = current_farmer.spaces.where(filled:0).sample
    newplant.space = targetspace
    targetspace.plant = newplant
    targetspace.filled = 1
		redirect_to show_path
	end

	 def create

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
