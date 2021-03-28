class PuppiesController < ApplicationController
    def index
        @litter = Litter.find(params[:litter_id])
        @puppies = Puppy.all
    end
    
    def new
        @litter = Litter.find(params[:litter_id])
        @breeds = Breed.all
        @puppy = Puppy.new
    end

    def create
        @litter = Litter.find(params[:litter_id])
        @puppy = Puppy.new(puppy_params)
        @puppy.litter = @litter
        
        if @puppy.save
            redirect_to puppy_path(@puppy)
          else
            render :new
        end
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

    def puppy_params
        params.require(:puppy).permit(:name, :coat, :gender, :weight, :breed_id)
    end
end
