class ParentsController < ApplicationController
  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new
    @parent.save
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
    params.require(:parent).permit(:name, :weight, :coat, :description, :gender)
  end

end
