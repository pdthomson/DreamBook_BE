require 'rails_helper'

RSpec.describe 'All Blogs API' do
  it "api call can get all blogs" do 
    create_list(:blog, 3)

    get '/api/v1/blogs'

    blogs = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq(200)
    expect(blogs[:data].count).to eq(3)

    blogs[:data].each do |blog|
      expect(blog).to have_key(:id)
      expect(blog[:id]).to be_a(String)

      expect(blog[:attributes]).to be_a(Hash)
      expect(blog[:attributes]).to have_key(:title)
      expect(blog[:attributes][:title]).to be_a(String)
      
      expect(blog[:attributes]).to have_key(:body)
      expect(blog[:attributes][:body]).to be_a(String)

      expect(blog[:attributes]).to have_key(:status)
      expect(blog[:attributes][:status]).to be_a(String)
      
      expect(blog[:attributes]).to have_key(:user_id)
      expect(blog[:attributes][:user_id]).to be_a(Integer)
    end
  end
end