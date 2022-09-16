require 'rails_helper'

RSpec.describe 'All Blogs API' do

  it "api call can get one blog" do
    blog1 = create(:blog)
    blog2 = create(:blog)

    get "/api/v1/blogs/#{blog1.id}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    json_response = JSON.parse(response.body, symbolize_names: true)
    blog = json_response[:data]

    expect(blog).to be_a(Hash)

    expect(blog[:attributes]).to have_key(:title)
    expect(blog[:attributes][:title]).to be_a(String)

    expect(blog[:attributes]).to have_key(:body)
    expect(blog[:attributes][:body]).to be_a(String)

    expect(blog[:attributes]).to have_key(:status)
    expect(blog[:attributes][:status]).to be_a(String)

    expect(blog[:attributes]).to have_key(:user_id)
    expect(blog[:attributes][:user_id]).to be_a(Integer)

    expect(blog[:attributes][:title]).to eq("#{blog1.title}")
    expect(blog[:attributes][:title]).to_not eq("#{blog2.title}")

    expect(blog[:attributes][:body]).to eq("#{blog1.body}")
    expect(blog[:attributes][:body]).to_not eq("#{blog2.body}")

    expect(blog[:attributes][:user_id]).to eq(blog1.user_id)
    expect(blog[:attributes][:user_id]).to_not eq(blog2.user_id)
  end
end
