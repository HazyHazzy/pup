class VisitationsController < ApplicationController
  before_action :set_visitation, only: [:edit, :update]

  def index
  end

  def new
    @breeder = Breeder.find(params[:breeder_id])
    @visitation = Visitation.new
    # raise
  end

  def create
    @breeder = Breeder.find(params[:breeder_id])
    @visitation = Visitation.new(rental_params)
    @visitation.user = current_user
    @visitation.breeder = @breeder
    @visitation.status = "pending"
    @visitation.save
    # if @visitation.save
    #   redirect_to rentals_path
    # else
    #   render :new
    # end
    # raise
  end

  def edit; end

  def update
    @visitation.update(visit_params)
    redirect_to visitation_path(@visitation)
  end

  # def approve
  #   @breeder = Breeder.find(params[:breeder_id])
  #   @visitation = Visitation.find_by_id(params[:id])
  #   if @visitation.user_id == current_user.id
  #     @visitation.status = "approved"
  #     @visitation.save
  #   end
  # end

  # def decline
  #   @breeder = Breeder.find(params[:breeder_id])
  #   @visitation = Visitation.find_by_id(params[:id])
  #   if @visitation.user_id == current_user.id
  #     @visitation.status = "decline"
  #     @visitation.save
  #   end
  # end

  private

  def set_visitation
    @visitation = Visitation.find(params[:id])
  end

  def visit_params
    params.require(:visitation).permit(:status)
  end
end
