class Api::MoviesController < ApplicationController
    def index
        render json: Movie.all
    end
    
    def show
        list = Movie.find(params[:id])
        render json: list
    end
end