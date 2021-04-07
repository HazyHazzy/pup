class LittersController < ApplicationController
    def index
        @litters = Litter.all
    end

    def new
        @breeder = Breeder.find(params[:breeder_id])
        @studs = Parent.where(gender: "Male")
        @moms = Parent.where(gender: "Female")
        @litter = Litter.new
    end

    def create
        @breeder = Breeder.find(params[:breeder_id])
        @litter = Litter.new(litter_params)
        @litter.breeder = @breeder

        if @litter.save
            redirect_to litter_path(@litter)
          else
            render :new
        end
    end

    def edit
        @litter = Litter.find(params[:id])
    end

    def update
        @litter = Litter.find(params[:id])
        @litter.update(litter_params)

        redirect_to litter_path(@litter)
    end

    def destroy
        @litter = Litter.find(params[:id])
        @litter.destroy

        redirect_to breeder_litters_path(@litter.breeder)

    end

    def show
        @litter = Litter.find(params[:id])
    end

    private

    def litter_params
        params.require(:litter).permit(:name, :birth_date, :stud_id, :mom_id, :photo)
    end
end
