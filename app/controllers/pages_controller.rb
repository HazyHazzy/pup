class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_brand
    @breeder = Breeder.where(user: current_user)
    # rentals = @games.map do |game|
    #   game.rentals
    # end
    # @my_rentals = rentals.flatten
    # @my_rentals = current_user.incoming_rentals
  end

  def visitation
    @my_visitations = current_user.visitations
  end
end
