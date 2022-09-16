require 'rails_helper'

RSpec.describe 'A blogs comments API' do

  it "can make an api call returning a blogs comments" do
    blog = Blog.create!(title: 'Link Pizards', body: 'They was plink', status: 'shared', user_id: 1, id: 1)
    comment1 = Comment.create!(comment_text: 'Thats weird boy, capped bussins', user_id: 2, blog_id: blog.id)
    comment2 = Comment.create!(comment_text: "I like turtles", user_id: 3, blog_id: blog.id)

    get "/api/v1/blogs/#{blog.id}/comments"

    # expect(response).to be_successful
    # expect(response.status).to eq(200)

    json_response = JSON.parse(response.body, symbolize_names: true)
    comments = json_response[:data]

    expect(comments.count).to eq(2)

    comments.each do |comment|
      expect(comment[:attributes]).to have_key(:user_id)
      expect(comment[:attributes][:user_id]).to be_an(Integer)

      expect(comment[:attributes]).to have_key(:blog_id)
      expect(comment[:attributes][:blog_id]).to be_an(Integer)

      expect(comment[:attributes]).to have_key(:comment_text)
      expect(comment[:attributes][:comment_text]).to be_an(String)
    end
  end


end
