class SpacesController < ApplicationController
	before_filter :authenticate_space!
  @plant

  	def index
    	@spaces = Space.all
  	end

  	def show
    	@space = Space.find(params[:id])
  	end
end
