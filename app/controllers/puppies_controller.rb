class PuppiesController < ApplicationController
    def new
        @puppy = Puppy.new
    end

    def create
        @puppy = Puppy.new(puppy_params)
        @puppy.save
    end

    def edit
        @puppy = Puppy.find(params[:id])
    end

    def update
        @puppy = Puppy.find(params[:id])
        @puppy.update(puppy_params)

        redirect_to puppy_path(@puppy)
    end

    def destroy
        @puppy = Puppy.find(params[:id])
        @puppy.destroy

        redirect_to puppies_path
    end

    def show
        @puppy = Puppy.find(params[:id])
    end

    private

    def pup_params
        params.require(:puppy).permit(:name, :coat, :gender, :weight)
    end
end
