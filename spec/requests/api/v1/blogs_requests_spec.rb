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

  it 'creates a blog' do
    blog_params = ({
                title: 'Purple Lizards',
                body: 'Had a dream where there was purple lizards everywhere',
                status: 'shared',
                user_id: 12 
                })
    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/blogs", headers: headers, params: JSON.generate(blog_params)

    expect(response).to be_successful 
    expect(response.status).to eq(201)

    created_blog = Blog.last

    expect(created_blog.title).to eq(blog_params[:title])
    expect(created_blog.title).to eq('Purple Lizards')
    expect(created_blog.body).to eq(blog_params[:body])
    expect(created_blog.status).to eq('shared')
    expect(created_blog.user_id).to eq(12)
  end

  it 'does not create blog' do
        blog_params = ({
                title: 'Purple Lizards',
                body: 'Had a dream where there was purple lizards everywhere',
                status: 'shared'
                })
    headers = {"CONTENT_TYPE" => "application/json"}
    post "/api/v1/blogs", headers: headers, params: JSON.generate(blog_params)

    expect(response).to_not be_successful 
    expect(response.status).to eq(400) 
  end

  it 'updates a blog' do
    blog = create(:blog)
    previous_title = blog.title
    previous_body = blog.body

    blog_params = ({
                blog_id: blog.id,
                title: 'Pink Lizards'
                })

    headers = {"CONTENT_TYPE" => "application/json"}
    patch "/api/v1/blogs/#{blog.id}", headers: headers, params: JSON.generate(blog_params)
    
    updated_blog = Blog.find_by(id: blog.id)
    expect(response).to be_successful
    expect(updated_blog.title).to_not eq(previous_title)
    expect(updated_blog.body).to eq(previous_body)
  end

  it 'deletes a blog' do
    blog = create(:blog)

    expect{ delete "/api/v1/blogs/#{blog.id}"}.to change(Blog, :count).by(-1)
    expect(response).to be_successful
    expect(response.status).to eq(204)
    expect{Blog.find(blog.id)}.to raise_error(ActiveRecord::RecordNotFound)
  end
end