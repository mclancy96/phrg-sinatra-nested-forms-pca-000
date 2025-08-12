class PiratesController < ApplicationController
  def index
    # Render the root page with welcome message
    render :index
  end

  def new
    # Initialize a new pirate instance for the form
    @pirate = Pirate.new
    # Build two ships for the nested form
    2.times { @pirate.ships.build }
    render :new
  end

  def create
    # Handle form submission and create pirate with ships using nested attributes
    # Convert ships array to ships_attributes format for ActiveRecord
    processed_params = pirate_params.dup
    processed_params[:ships_attributes] = processed_params.delete(:ships) if processed_params[:ships].present?

    @pirate = Pirate.new(processed_params)

    if @pirate.save
      redirect_to pirate_path(@pirate)
    else
      render :new
    end
  end

  def show
    # Display pirate and ship information
    @pirate = Pirate.find(params[:id])
    render :show
  end

  private

  def pirate_params
    # Define strong parameters for pirate and nested ships
    params.require(:pirate).permit(:name, :weight, :height, ships: %i[name type booty])
  end
end
