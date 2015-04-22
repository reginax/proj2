class FarmersController < ApplicationController
  before_filter :authenticate_farmer!

  def index
    @farmers = Farmer.all
  end

  def show
    @farmer = Farmer.find(params[:id])
  end
  
end
