class VisitationsController < ApplicationController
  before_action :set_visitation, only: [:edit, :update]

  def index
  end

  def new
    @breeder = Breeder.find(params[:breeder_id])
    @visitation = Visitation.new
    @litter = Litter.find(params[:litter_id])
    @puppy_names = @litter.puppies.map(&:name)
    # raise
  end

  def create
    @breeder = Breeder.find(params[:breeder_id])
    # @litters = Litter.find(@breeder.litter_ids[0])
    # raise
    @visitation = Visitation.new(visit_params)
    @visitation.user = current_user
    @visitation.breeder = @breeder
    @visitation.status = "pending"
    @visitation.save
    if @visitation.save
      redirect_to my_requests_path
    else
      render :new
    end
    # raise
  end

  def edit
    @breeder = Breeder.find(params[:breeder_id])
  end

  def update
    @visitation.update(visit_params)
    redirect_to my_brand_path
  end

  private

  def set_visitation
    @visitation = Visitation.find(params[:id])
  end

  def visit_params
    params.require(:visitation).permit(:name, :status, :home_address, :email_address, :contact_number, :occupation, :reference, :screening_question, :puppy_select)
  end
end
