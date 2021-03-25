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
    @breeder = Breeder.new(breeder_params)

    @breeder.save
    if @breeder.save
      redirect_to breeder_path(@breeder)
    else
      render :new
    end
  end

  def edit
    @breeder = Breeder.find(params[:id])
  end

  def update
    @breeder = Breeder.find(params[:id])
    @breeder.update(breeder_params)

    redirect_to breeder_path(@breeder)
  end

  def destroy
    @breeder = Breeder.find(params[:id])
    @breeder.destroy
  end

  def breeder_params
    params.require(:breeder).permit(:name, :about_us, :email, :phone_number, :city)
  end
end
