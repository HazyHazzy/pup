class ParentsController < ApplicationController

  def new
    @breeder = Breeder.find(params[:breeder_id])
    @breeds = Breed.all
    @parent = Parent.new
  end

  def create
    @breeder = Breeder.find(params[:breeder_id])
    @parent = Parent.new(parent_params)
    @parent.breeder = @breeder

    if @parent.save
      redirect_to breeder_parent_path(@breeder, @parent)
    else
      render :new
    end
  end

  def show
    @parent = Parent.find(params[:id])
  end

  def edit
    @breeder = Breeder.find(params[:breeder_id])
    @parent = Parent.find(params[:id])
    @parent.breeder = @breeder
    @breeds = Breed.all
  end

  def destroy
    @parent = Parent.find(params[:id])
    @breeder = Breeder.find(params[:breeder_id])
    @parent.breeder = @breeder
    @parent.destroy

    redirect_to breeder_path(@breeder)
  end

  def update
    @breeder = Breeder.find(params[:breeder_id])
    @parent = Parent.find(params[:id])
    @parent.breeder = @breeder
    @parent.update(parent_params)

    redirect_to breeder_parent_path(@breeder, @parent)
  end

  private

  def parent_params
    params.require(:parent).permit(:name, :weight, :coat, :description, :gender, :breed_id, :photo)
  end

end
