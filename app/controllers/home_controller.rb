class HomeController < ApplicationController

  def index
    flash[:notice] = "todo, change css for gritter"
  end

end
