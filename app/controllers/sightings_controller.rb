class SightingsController < ApplicationController
  def index
    sightings = Sighting.all 

    options = {
      include: [:bird, :location]
    }

    render json: JSON.pretty_generate(JSON.parse(SightingSerializer.new(sightings, options).to_json))
  end
  
  def show
    sighting = Sighting.find(params[:id])
    
    options = {
      include: [:bird, :location]
    }

    render json: JSON.pretty_generate(JSON.parse(SightingSerializer.new(sighting, options).to_json))
  end
end
