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

  # xit 'it returns an error if blog id does not exist' do
  #   blog = create(:blog)
  #   blog2 = create(:blog)

  #   get '/api/vi/blogs/12345'

  #   expect(response.status).to eq(404)
  # end

  # xit 'creates a blog' do
  #   blog_params = ({
  #               title: 'Pulble Lizards',
  #               body: 'Had a dream where there was purple lizards everywhere',
  #               status: 0,
  #               user_id: 12 
  #               })
  #   headers = {"CONTENT_TYPE" => "application/json"}
  #   post "/api/v1/blogs", headers: headers, params: JSON.generate(blog: blog_params)

  #   expect(response).to be_successful 
  #   expect(response.status).to eq(201)

  #   created_blog = Blog.last


  #   expect(created_blog.title).to eq(blog_params[:title])
  #   expect(created_blog.title).to eq('Pulble Lizards')
  #   expect(created_blog.body).to eq(blog_params[:body])
  #   expect(created_blog.status).to eq('shared')
  #   expect(created_blog.user_id).to eq(12)
  # end
end