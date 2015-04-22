class PokemonsController < ApplicationController
	def capture
		@captured = Pokemon.find(params[:id])
		@captured.trainer_id = current_trainer.id
		@captured.save
		redirect_to root_path
	end

	def damage
		@damaged = Pokemon.find(params[:id])
		@damaged.health -= 10
		@damaged.save
		if @damaged.health <= 0
			@damaged.destroy
		end
		redirect_to @damaged.trainer
	end

	def new
		@pokemon = Pokemon.new
	end

	 def create
    	@pokemon = Pokemon.create(pokemon_params)
    	@pokemon.health = 100
		@pokemon.level = 1
		@pokemon.trainer_id = current_trainer.id
		@pokemon.save
    	if @pokemon.save
      		redirect_to current_trainer
    	else
      		flash[:error] = @pokemon.errors.full_messages.to_sentence
      		render "new"
    	end
  	end


  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end
end