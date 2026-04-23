class PetsController < ApplicationController
  def index
    @pets = Pet.includes(:owner)
  end

  def show
    @pet = Pet.includes(appointments: [:vet, :treatments]).find(params[:id])
  end
end