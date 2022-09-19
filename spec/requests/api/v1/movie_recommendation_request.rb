require 'rails_helper'

RSpec.describe 'All Movie Recommendations API' do
  it 'returns list of movie recommendations based off of keyword', :vcr do 
    parsed_json = MovieService.movie_keyword_recommendations("pink")
    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    movie_recommendation_data = parsed_json[:results][0]
    expect(movie_recommendation_data).to include(:title, :overview)
    expect(movie_recommendation_data[:title]).to be_a String
    expect(movie_recommendation_data[:overview]).to be_a String
    expect(movie_recommendation_data[:id]).to be_a Integer
  end
end