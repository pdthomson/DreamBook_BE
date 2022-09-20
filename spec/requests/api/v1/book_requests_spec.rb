require 'rails_helper'
RSpec.describe 'All Recommended Books API' do
  it 'api call can get all recommended books by keyword', :vcr do
  blog = ({
    title: 'Purple Lizards',
    body: 'Had a dream where there was purple lizards everywhere',
    status: 'shared',
    keyword: 'lizard'
    })

    get "/api/v1/book_recommendations?keyword=#{blog[:keyword]}"

    books = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)

    books[:data].each do |book|
      # binding.pry
      # expect(book).to have_key(:id)
      # expect(book[:id]).to be_a(String)
      expect(book[:attributes]).to be_a(Hash)
      expect(book[:attributes]).to have_key(:title)
      expect(book[:attributes][:title]).to be_a(String)

      expect(book[:attributes]).to have_key(:author)
      expect(book[:attributes][:author]).to be_a(String)
    end
  end
end
