require 'rails_helper'

RSpec.describe 'All Book Recommendations API' do
  it 'returns list of book recommendations based off of keyword', :vcr do
    book_data = BookService.book_keyword_recommendations('blue')
    expect(book_data).to be_a Hash
    expect(book_data[:docs]).to be_a Array
    parsed_json_serializer = BookSerializer.get_book_recommendation(book_data)
    expect(parsed_json_serializer).to be_a Hash
    expect(parsed_json_serializer[:data][0][:id]).to be_a String
    expect(parsed_json_serializer[:data][0][:attributes][:title]).to be_a String
    expect(parsed_json_serializer[:data][0][:attributes][:author]).to be_a String
  end
end
