class BreedsController < ApplicationController
  def index
    @breeds = Breed.all
  end

  def new
    @breed = Breed.new
  end

  def create
    @breed = Breed.new
    @breed.save
  end

  def edit
    @breed = Breed.find(params[:id])
  end

  def update
    @breed = Breed.find(params[:id])
    @breed.update(breed_params)
  end

  def destory
    @breed = Breed.find(params[:id])
    @breed.destory
  end

  def breed_params
    params.require(:breed).permit(:name, :description, :family_friendly,
                                  :trainability, :minimum_weight,
                                  :maximum_weight, :minimum_life_span,
                                  :maximum_life_span, :health_issues)
  end
end
