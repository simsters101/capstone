class Api::DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    render 'index.json.jb'
  end

  def show
    @destination = Destination.find_by(id: params[:id])
    render 'show.json.jb'
  end
end
