class PetsController < ApplicationController

  # . as a user I want to see a list of all pets (X)
  def index
    @pets = Pet.all
  end

  # . as a user I want to see the detais of one pets (X)
  def show
    @pet = Pet.find(params[:id])
  end

  # . as a user I want to add a new pet to the list
  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render "new", status: :unprocessable_entity
    end
  end

  # . as a user I want to edit a pet
  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])
    if @pet.update(pet_params)
      redirect_to pet_path(@pet)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  # . as a user I want to delte a pet
  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path, status: :see_other
  end

  private

  def pet_params
    params.require(:pet).permit(:name, :address, :species, :found_on)
  end
end
