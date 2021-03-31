class LittersController < ApplicationController
    def new
        @litter = Litter.new
    end

    def create
        @litter = Litter.new(litter_params)
        @litter.save
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

        redirect_to litters_path
    end

    def show
        @litter = Litter.find(params[:id])
    end

    private

    def litter_params
        params.require(:litter).permit(:name, :birth_date)
    end
end
