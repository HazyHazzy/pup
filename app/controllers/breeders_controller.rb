class BreedersController < ApplicationController
  def index
    @breeders = Breeder.all
  end

  def show
    @breeder = Breeder.find(params[:id])
  end

  def new
    @breeder = Breeder.new
  end

  def create
    @breeder = Breeder.new
    @breeder.save
  end

  def edit
    @breeder = Breeder.find(params[:id])
  end

  def update
    @breeder = Breeder.find(params[:id])
    @breeder.update(breeder_params)
  end

  def destroy
    @breeder = Breeder.find(params[:id])
    @breeder.destroy
  end

  def breeder_params
    params.require(:breeder).permit(:name, :about_us, :email, :phone_number, :city)
  end
end
