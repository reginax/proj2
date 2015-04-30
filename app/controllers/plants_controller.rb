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
        harvested = Plant.find(params[:id])
        current_farmer.dolladollabillz += harvested.health
        harvested.space.filled = 0
        # @harvested.space.plant = nil
        harvested.space.save
        harvested.destroy
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
      if current_farmer.spaces.where(filled:0).size == 0
        flash[:error] = "Not enough space in your farm! Swiper no swiping!"
        redirect_to ("/farmers/" + params[:f])
        return
      end
        @that = Plant.find(params[:id])
        @mine = current_farmer.spaces.where(filled:0).sample
        @mine.plant = @that
        @that.space = @mine
        @mine.plant.save
        @mine.save
        redirect_to ("/farmers/" + params[:f])
    end

    def squash
      tosquish = Plant.find(params[:id])
        if !tosquish.health?
            tosquish.health = 0
        end
        tosquish.health -= 5
        if tosquish.health <= 0
          sp = tosquish.space
          sp.filled = 0
          sp.plant = nil
          tosquish.destroy
          sp.save
        end
        tosquish.save
        redirect_to ("/farmers/" + params[:f])
    end
        

    def buy
        @farmer = current_farmer
        @freeSpace = false
        for s in @farmer.spaces
            if s.filled == 0 
                @freeSpace = true
            end
        end
      if @farmer.spaces.where(filled:0).size == 0
        flash[:error] = "Not enough space in your farm!"
        redirect_to show_path
          return
      end
        
        if !@farmer.dolladollabillz?
            @farmer.dolladollabillz = 50
        end
        if @farmer.dolladollabillz < 5
          flash[:error] = "Not enough dolladollabillz!"
          redirect_to show_path
          return
        else 
            @farmer.dolladollabillz -= 5
        end
        @newplant = Plant.create(name: params[:type], health: 5)
        
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
