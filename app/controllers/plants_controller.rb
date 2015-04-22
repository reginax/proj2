class PlantsController < ApplicationController
	def plot
		@plotted = Plant.find(params[:id])
		@plotted.farmer_id = current_farmer.id
		@plotted.save
		redirect_to root_path
	end

	def damage
		@damaged = Plant.find(params[:id])
		@damaged.health -= 10
		@damaged.save
		if @damaged.health <= 0
			@damaged.destroy
		end
		redirect_to @damaged.farmer
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