class PiratesController < ApplicationController
  def index
    # Render the root page with welcome message
    render :index
  end

  def new
    # Initialize a new pirate instance for the form
    @pirate = Pirate.new
    render :new
  end

  def create
    # Handle form submission and create pirate with ships
    @pirate = Pirate.new(pirate_params.except(:ships))

    # Create ships from nested params
    @ships = []
    if pirate_params[:ships].present?
      pirate_params[:ships].each do |ship_params|
        @ships << Ship.new(ship_params) if ship_params.values.any?(&:present?)
      end
    end

    # Render show page with created pirate and ships
    render :show
  end

  def show
    # Display pirate and ship information
    @pirate = Pirate.find(params[:id])
    @ships = Ship.all.last(2) # Get the last 2 ships created
    render :show
  end

  private

  def pirate_params
    # Define strong parameters for pirate and nested ships
    params.require(:pirate).permit(:name, :weight, :height, ships: %i[name type booty])
  end
end
