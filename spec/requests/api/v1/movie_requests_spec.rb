require 'rails_helper'

RSpec.describe 'All Recommended Movies API' do
  it "api call can get all recommended movies", :vcr do 
    blog = ({
      title: 'Purple Lizards',
      body: 'Had a dream where there was purple lizards everywhere',
      status: 'shared',
      keyword: 'lizards'
      })

    get "/api/v1/movie_recommendations?keyword=#{blog[:keyword]}"

    movies = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    movies[:data].each do |movie|
      expect(movie).to have_key(:id)
      expect(movie[:id]).to be_a(Integer)

      expect(movie[:attributes]).to be_a(Hash)
      expect(movie[:attributes]).to have_key(:title)
      expect(movie[:attributes][:title]).to be_a(String)
      
      expect(movie[:attributes]).to have_key(:description)
      expect(movie[:attributes][:description]).to be_a(String)
    end
  end
end