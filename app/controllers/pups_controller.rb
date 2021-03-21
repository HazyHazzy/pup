class PupsController < ApplicationController
    def new
        @pup = Pup.new
    end

    def create
        @pup = Pup.new(pup_params)
        @pup.save
    end

    def edit
        @pup = Pup.find(params[:id])
    end

    def update
        @pup = Pup.find(params[:id])
        @pup.update(pup_params)
    
        redirect_to pup_path(@pup)
    end

    def destroy
        @pup = Pup.find(params[:id])
        @pup.destroy
    
        redirect_to pups_path
      end

    private

    def pup_params
        params.require(:pup).permit(:name, :coat, :gender, :weight)
      end
end
