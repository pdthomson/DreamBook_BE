class Api::V1::MovieRecommendationsController < ApplicationController
  def index
    api_call = MovieService.movie_keyword_recommendations(params[:keyword])
    render json: MovieSerializer.get_movie_recommendations
  end
end


