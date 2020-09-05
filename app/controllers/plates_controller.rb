class PlatesController < ApplicationController
  before_action :set_plate, only: [:show, :edit, :update, :destroy]

  def index
    # All the Plates
    @plates = Plate.all
  end

  def show
  end
  
  def new
    # Just for show
    @plate = Plate.new
  end
  
  def create
    # actually creating the 'plate' object
    @plate = Plate.new(plate_params)
    if @plate.save
      redirect_to plate_path(@plate.id)
    else
      render :new
    end
  end
  
  def edit
    # Just for show
  end
  
  def update
    # actually editing the 'plate' object
    if  @plate.update(plate_params)
      redirect_to @plate
    else
      render :edit
    end
  end

  def destroy
    @plate.destroy
    redirect_to plates_path
  end

  private

  def plate_params
    params.require(:plate).permit(:name, :meal, :description)
  end

  def set_plate
    @plate = Plate.find(params[:id])
  end

end
