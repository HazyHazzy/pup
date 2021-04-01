class ParentsController < ApplicationController
  
  def new
    @breeder = Breeder.find(params[:breeder_id])
    @breed = Breed.all
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
    @parent = Parent.find(params[:id])
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
  end

  def update
    @parent = Parent.find(params[:id])
    @parent.update(parent_params)
  end

  private

  def parent_params
    params.require(:parent).permit(:name, :weight, :coat, :description, :gender, :breed_id)
  end

end
