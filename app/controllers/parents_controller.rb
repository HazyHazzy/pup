class ParentsController < ApplicationController
  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new
    @parent.save
  end

  def edit
    @parent = Parent.find(params[:id])
  end

  def destroy
    @parent = Parent.find(params[:id])
    @parent.destroy
  end

end
