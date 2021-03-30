class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def my_brand
    @breeder = Breeder.where(user: current_user)
    visitations = @breeder.map do |breeder|
      breeder.visitations
    end
    @my_visitations = visitations.flatten
    # @my_visitations = current_user.incoming_visitations
  end

  def my_requests
    @my_visitations = current_user.visitations
  end
end
