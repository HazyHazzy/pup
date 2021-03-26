class PuppiesController < ApplicationController
    def new
        @pup = Puppy.new
    end

    def create
        @pup = Puppy.new(pup_params)
        @pup.save
    end

    def edit
        @pup = Puppy.find(params[:id])
    end

    def update
        @pup = Puppy.find(params[:id])
        @pup.update(pup_params)

        redirect_to pup_path(@pup)
    end

    def destroy
        @pup = Puppy.find(params[:id])
        @pup.destroy

        redirect_to pups_path
    end

    def show
        @pup = Puppy.find(params[:id])
    end

    private

    def pup_params
        params.require(:pup).permit(:name, :coat, :gender, :weight)
    end
end
