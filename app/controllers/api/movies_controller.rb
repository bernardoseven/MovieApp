class Api::MoviesController < ApplicationController
    skip_before_filter :verify_authenticity_token
    def index
        render json: Movie.all
    end
    
    def show
        list = Movie.find(params[:id])
        render json: list
    end
    
    def create
        list = Movie.new(list_params)
        if list.save
            render json: {
                status: 200, 
                message: "Succefully created movie",
                movie: list
            }.to_json
        else
            render json: {
                status: 500,
                errors: list.errors
            }.to_json
        end
    end
    
    def destroy
        list = Movie.find(params[:id])
        list.destroy
        render json: {
            status: 200,
            message: "Succefully deleted movie"
        }.to_json
    end
    
    private
    def list_params
        params.require("movie").permit("title")
    end
end