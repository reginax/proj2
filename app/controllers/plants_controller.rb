class PlantsController < ApplicationController
  
  @removed = false
# not used anymore
    def remove
        if !current_farmer.dolladollabillz?
            @current_farmer.dolladollabillz = 0
        end
        current_farmer.dolladollabillz += 2
        current_farmer.save
        redirect_to current_farmer
    end

    def harvest
        if !current_farmer.dolladollabillz?
            current_farmer.dolladollabillz = 0
        end
        current_farmer.dolladollabillz += 5
        @harvested = Plant.find(params[:id])
        @harvested.space.filled = 0
        # @harvested.space.plant = nil
        @harvested.space.save
        @harvested.destroy
        current_farmer.save
        @removed = true
        # @harvested.save
        redirect_to current_farmer
    end

    def water
        @watered = Plant.find(params[:id])
        if !@watered.health?
            @watered.health = 100
        end
        @watered.health += 10
        @watered.save
        redirect_to(:back)
    end

    def new
        @plant = Plant.new
    end

    def steal
        @that = Plant.find(params[:id])
        @mine = current_farmer.spaces.where(filled:0).sample
        @mine.plant = @that
        @that.space = @mine
        @mine.plant.save
        @mine.save
    end

    def squash
        @damaged = Plant.find(params[:id])
        if !@damaged.health?
            @damaged.health = 0
        end
        @damaged.health -= 5
        @damaged.save
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
        @plant.health = 10
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
