require 'rails_helper'
RSpec.describe BookService do
  it 'retrieves keyword book data and parses the response', :vcr do
    keyword = 'blue'
    parsed_json = BookService.book_keyword_recommendations(keyword)
    expect(parsed_json).to be_a Hash
    expect(parsed_json[:docs]).to be_a Array
    searched_book_data = parsed_json[:docs][0]
    expect(searched_book_data).to include(:key, :title, :author_name)
    expect(searched_book_data[:key]).to be_a String
    expect(searched_book_data[:title]).to be_a String
    expect(searched_book_data[:author_name]).to be_a Array
  end
end
