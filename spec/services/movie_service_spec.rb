require 'rails_helper'

RSpec.describe MovieService do
  it 'retrieves searched keyword movie data and parses the response', :vcr do
    keyword = 'pink'
    parsed_json = MovieService.movie_keyword_recommendations(keyword)
    expect(parsed_json).to be_a Hash
    expect(parsed_json[:results]).to be_a Array

    searched_movie_data = parsed_json[:results][0]
    expect(searched_movie_data).to include(:id, :title, :overview)
    expect(searched_movie_data[:title]).to be_a String
    expect(searched_movie_data[:id]).to be_a Integer
    expect(searched_movie_data[:overview]).to be_a String
  end
end 