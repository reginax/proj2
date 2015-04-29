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
        @harvested.space.filled = 0
        @harvested.space.save
        @harvested.destroy
        # @harvested.save
        redirect_to current_farmer
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
        @freeSpace = false
        for s in @farmer.spaces
            if s.filled == 0 
                @freeSpace = true
            end
        end
        if !@freeSpace
          flash[:error] = "No more space in your farm!"
          return
        end
        if !@farmer.dolladollabillz?
            @farmer.dolladollabillz = 50
        end
        if @farmer.dolladollabillz < 5
          flash[:error] = "Not enough dolladollabillz!"
          return
        else 
            @farmer.dolladollabillz -= 5
        end
        @newplant = Plant.create(name: params[:type])
        @targetspace = @farmer.spaces.where(filled:0).sample
        @newplant.space = @targetspace
        @targetspace.plant = @newplant
        @targetspace.filled = 1
        @targetspace.save
        @newplant.save
        @farmer.save
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
