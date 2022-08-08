class PlantPlotsController < ApplicationController 

  def destroy 
    PlantPlot.find_by(plant_id: params[:plant_id], plot_id: params[:plot_id]).destroy
    redirect_to '/plots'
  end
end