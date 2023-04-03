class BeersController < ApplicationController
    def index
        beers = Beer.all
        render json: beers
    end

    def create
        beer = Beer.create(beer_params)
        if beer.valid?
            render json: beer
        end

    end

    def update
        beer = Beer.find(params[:id])
        beer.update(beer_params)
        if beer.valid?
            render json: beer
        end
    end

    def destroy
        beer = Beer.find(params[:id])
        beer.destroy
        render json: beer
    end

    private
    def beer_params
        params.require(:beer).permit(:name, :abv, :style, :profile, :brewery, :image)
    end
end
