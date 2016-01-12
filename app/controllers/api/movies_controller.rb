class Api::MoviesController < ApplicationController
    def index
        render json: Movies.all
    end
end