class PiratesController < ApplicationController
  def index
    # Render the root page with welcome message
    render :index
  end

  def new
    # TODO: Initialize a new pirate instance for the form
    # Create a new Pirate object and build associated ships
    # Example: @pirate = Pirate.new
    # Example: @pirate.ships.build (to build ship forms)
    # Use Rails form helpers with nested attributes
  end

  def create
    # TODO: Handle form submission and create pirate with ships
    # Use strong parameters and ActiveRecord to create pirate with nested ships
    # Example: @pirate = Pirate.new(pirate_params)
    # Example: if @pirate.save
    # Redirect to show page or render show template
  end

  def show
    # TODO: Find and display pirate and ship information
    # Use ActiveRecord to find the pirate by ID
    # Example: @pirate = Pirate.find(params[:id])
    # Include pirate name, weight, height and all associated ship details
  end

  private

  def pirate_params
    # TODO: Define strong parameters for pirate and nested ships
    # Allow pirate attributes: name, weight, height
    # Allow nested ships attributes: name, type, booty
    # Example: params.require(:pirate).permit(:name, :weight, :height, ships_attributes: [:name, :type, :booty])
  end
end
