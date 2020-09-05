class IngredientsController < ApplicationController
  before_action :set_plate
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  def index
    # plate id
    @ings = @plate.ingredients.all
  end

  def show
  end

  def new
    @ing = @plate.ingredients.new
  end
  
  def create
    @ing = @plate.ingredients.new(ing_params)
    # binding.pry
    if @ing.save
      redirect_to plate_ingredients_path(@plate)
    else
      render :new
    end
  end

  def edit
    # before action
    # nothing in here for now???
  end

  def update
    if @ingredient.update(ing_params)
      redirect_to plate_ingredients_path(@plate.id) # -->> [@plate, @ingredient]
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to plate_ingredients_path(@plate.id)
  end

  private
  

  def set_plate
    @plate = Plate.find(params[:plate_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ing_params
    params.require(:ingredient).permit(:name, :amount)
  end
end
