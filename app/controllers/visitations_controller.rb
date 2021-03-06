class VisitationsController < ApplicationController
  before_action :set_visitation, only: [:edit, :update, :destroy]

  def index
  end

  def new
    @breeder = Breeder.find(params[:breeder_id])
    @visitation = Visitation.new
    @litter = Litter.find(params[:litter_id])
    @puppy_names = @litter.puppies.map(&:name)
  end

  def create
    @breeder = Breeder.find(params[:breeder_id])
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
  end

  def edit
    @breeder = Breeder.find(params[:breeder_id])
  end

  def update
    @visitation.update(visit_params)
    redirect_to my_requests_path
  end

  def destroy
    @visitation.destroy
    redirect_to my_requests_path
  end

  private

  def set_visitation
    @visitation = Visitation.find(params[:id])
  end

  def visit_params
    params.require(:visitation).permit(:name, :status, :home_address, :email_address,
      :contact_number, :occupation, :reference, :why_dog, :puppy_select, :have_dog,
      :why_interested, :health_issues_aware, :primary_caretaker, :dewelling, :have_children,
      :lifestyle, :hours_dog_leftalone)
  end
end
